module ImportData
  class BulkyWastes < Base

    def import
      # bulky_wastes.delete_all if bulky_wastes.any?

      (4..excel.last_row).each do |row|
        if excel.cell(row, 1).present?
          locations(row, 1).each do |location|
            waste = Waste.new(data(row, 1, location))
            LogActivity.save(waste) unless waste.save
          end
        end

        if excel.cell(row, 4).present?
          locations(row, 4).each do |location|
            waste = Waste.new(data(row, 2, location))
            LogActivity.save(waste) unless waste.save
          end
        end
      end
    end

    private

    def bulky_wastes
      @bulky_wastes ||= Waste.bulky_wastes
    end

    def locations(row, col = 1)
      street = clean_street(excel.cell(row, col))
            locations_by_street = Location.parse_numbers(street, '')

            if locations_by_street.empty?
              LogActivity.save("Nie odnaleziono lokalizacji dla ulicy '#{street}'")
            end

      return locations_by_street
    end

    def data(row, group_id, location = nil)
      if group_id == 1
        {
          kind: 5,
          group_id: 1,
          street: location.full_address,
          data: {
            info: excel.cell(row, 1),
            group_name: 'Jednorodzinne',
            date: date(row)
          }
        }
      else
        {
          kind: 5,
          group_id: 2,
          street: location.full_address,
          data: {
            info: excel.cell(row, 4),
            group_name: 'Wielolokalowe',
            weekday: weekday(row)
          }
        }
      end
    end

    def weekday(row)
      excel.cell(row, 5).split(',').map { |item| I18n.t('date.day_names').index(item.downcase) }
    end

    def date(row)
      excel.cell(row, 2).split(';').map { |i| parse_date(i + ".#{year}").to_date }
    end

    def year
      @year ||= excel.cell(1,1).match(/\d{4}/).to_s
    end
  end
end
