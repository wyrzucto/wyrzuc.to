module ImportData
  class BatteryPoints < Base

    attr_reader :number_col_inx, :street_col_inx, :desc_col_inx

    def import
      battery_points.delete_all if battery_points.any?

      @desc_col_inx = 1
      @street_col_inx = 3
      @number_col_inx = 4

      (excel.first_row..excel.last_row).each do |row|
        waste = Wastes::BatteryCollectionPoint.new(data(row))
        LogActivity.save(waste) unless waste.save
      end
    end

    private

    def battery_points
      @battery_points ||= Wastes::BatteryCollectionPoint.all
    end

    def street_cell(row)
      excel.cell(row, street_col_inx)
    end

    def number_cell(row)
      number = excel.cell(row, number_col_inx)
      if number.to_f.to_s == number.to_s
        number.to_i
      else
        number
      end
    end

    def address_cell(row)
      [ street_cell(row), number_cell(row) ].compact.join(' ')
    end

    def data(row)
      {
        kind: 6,
        street: address_cell(row),
        data: {
          info: excel.cell(row, desc_col_inx),
          name: excel.cell(row, desc_col_inx),
        }
      }
    end
  end
end
