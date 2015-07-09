module ImportData
  class Pharmacies < Base

    def import
      pharmacies.delete_all if pharmacies.any?
      (excel.first_row..excel.last_row).each do |row|
        next if excel.font(row, 1).bold? || excel.cell(row, 1).nil?
        waste = Waste.new(data(row))
        LogActivity.save(waste) unless waste.save
      end
    end

    private

    def pharmacies
      @pharmacies ||= Waste.pharmacies
    end

    def data(row)
      {
        kind: 1,
        street: clean_street(excel.cell(row, 2)),
        data: {
          info: excel.cell(row, 2),
          name: excel.cell(row, 1),
          post_code: excel.cell(row, 10),
          phone_number: excel.cell(row, 11),
          date: [
            parse_date(excel.cell(row, 3)),
            parse_date(excel.cell(row, 4)),
            parse_date(excel.cell(row, 5)),
            parse_date(excel.cell(row, 6)),
            parse_date(excel.cell(row, 7)),
            parse_date(excel.cell(row, 8))
          ]
        }
      }
    end
  end
end
