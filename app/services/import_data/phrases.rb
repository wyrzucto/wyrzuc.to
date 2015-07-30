module ImportData
  class Phrases < Base

    def import
      excel.sheet(0)
      (1..excel.last_column).each do |col|
        (2..excel.last_row).each do |row|
          next if excel.cell(row, col).nil?

          phrase = Phrase.find_by_name(excel.cell(row, col))
	  puts phrase

          if phrase.nil?
            Phrase.create(data(row, col))
          else
            phrase.update_attributes(data(row, col))
          end
        end
      end
    end

    private

    def data(row, col)
      {
        name: excel.cell(row, col),
        fraction_id: fraction(col).id,
      }
    end

    def fraction(col)
      fraction_name = excel.cell(1,col)

      Fraction.find_or_create_by(name: fraction_name)
    end
  end
end
