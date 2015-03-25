module ImportData
  class HazardousWastes < Base

    def import
      HazardousWaste.delete_all if HazardousWaste.any?
      excel.sheet(1)
      (2..excel.last_row).each do |row|
        HazardousWaste.create(data(row))
      end
    end

    private

    def data(row)
      {
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
