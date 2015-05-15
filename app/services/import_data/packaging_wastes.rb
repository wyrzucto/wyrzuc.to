module ImportData
  class PackagingWastes < Base

    def import
      packaging_wastes.delete_all if packaging_wastes.any?
      (4..excel.sheet(0).last_row).each do |row|
        Waste.create(data(row))
      end
    end

    private

    def packaging_wastes
      @packaging_wastes ||= Waste.packaging_wastes
    end

    def data(row)
      {
        kind: 3,
        street: clean_street(excel.sheet(0).cell(row, 3)),
        data: {
          info: excel.sheet(0).cell(row, 3),
          weekday: {
            clear_glass:    [weekday(3, row)],
            colorful_glass: [weekday(4, row)],
            maculature:     [weekday(5, row)],
            plastic:        [weekday(6, row)]
          }
        }
      }
    end

    def weekday(waste_row, row)
      (2..excel.sheet(1).last_column).each do |col|
        is_empty = excel.sheet(1).cell(waste_row, col) != '-'
        included = eval(excel.sheet(1).cell(waste_row, col).split('-').join('..')).try(:include?, excel.sheet(0).cell(row, 2).to_i)

        return col-1 if is_empty && included
      end
      nil
    end
  end
end
