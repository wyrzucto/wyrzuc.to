module ImportData
  # This class provides methods that allow you to import information about bulky wastes
  class BulkyWastes < Base
    # rubocop:disable all
    def import
      if params['area'].present?
        Waste.bulky_wastes.where(area: params['area']).delete_all
      end

      (4..excel.last_row).each do |row|
        if excel.cell(row, 1).present?
          locations(row, 1).each do |location|
            waste = Waste.new(data(row, 1, location))
            LogActivity.save(waste) unless waste.save
          end
        end

        next if excel.cell(row, 4).empty?

        locations(row, 4).each do |location|
          waste = Waste.new(data(row, 2, location))
          LogActivity.save(waste) unless waste.save
        end
      end
    end
    # rubocop:enable all

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

      locations_by_street
    end

    # rubocop:disable Metrics/MethodLength
    def data(row, group_id, location = nil)
      if group_id == 1
        {
          kind: 5,
          group_id: 1,
          area: params['area'],
          street: location.full_address,
          location: location,
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
          area: params[:area],
          street: location.full_address,
          data: {
            info: excel.cell(row, 4),
            group_name: 'Wielolokalowe',
            weekday: weekday(row)
          }
        }
      end
    end
    # rubocop:enable Metrics/MethodLength

    def weekday(row)
      excel.cell(row, 5).split(',').map { |item| I18n.t('date.day_names').index(item.downcase) }
    end

    def date(row)
      excel.cell(row, 2).split(';').map { |i| parse_date(i + ".#{year}").to_date }
    end

    def year
      @year ||= excel.cell(1, 1).match(/\d{4}/).to_s
    end
  end
end
