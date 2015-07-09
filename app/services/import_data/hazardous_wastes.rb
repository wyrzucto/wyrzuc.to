module ImportData
  class HazardousWastes < Base

    def import
      hazardous_wastes.delete_all if hazardous_wastes.any?
      excel.sheet(1)
      (2..excel.last_row).each do |row|
        waste = Waste.new(data(row))
        LogActivity.save(waste) unless waste.save
      end
    end

    private

    def hazardous_wastes
      @hazardous_wastes ||= Waste.hazardous_wastes
    end

    def data(row)
      {
        kind: 2,
        street: clean_street(excel.cell(row, 2)),
        data: {
          info: excel.cell(row, 2),
          date: excel.cell(row, 3).split(' ').map { |date| parse_date(date) },
          hour: [
            I18n.l(Time.at(excel.cell(row, 4)).utc, format: :hour),
            I18n.l(Time.at(excel.cell(row, 5)).utc, format: :hour)
          ].join(' - ')
        }
      }
    end
  end
end
