module ImportData
  class BulkyWastes < Base

    def import
      # bulky_wastes.delete_all if bulky_wastes.any?

      (4..excel.last_row).each do |row|
        if excel.cell(row, 1).present?
          waste = Waste.new(data(row, 1))
          LogActivity.save(waste) unless waste.save
        end

        if excel.cell(row, 4).present?
          waste = Waste.new(data(row, 2))
          LogActivity.save(waste) unless waste.save
        end
      end
    end

    private

    def bulky_wastes
      @bulky_wastes ||= Waste.bulky_wastes
    end

    def data(row, group_id)
      if group_id == 1
        {
          kind: 5,
          group_id: 1,
          street: clean_street(excel.cell(row, 1)),
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
          street: clean_street(excel.cell(row, 4)),
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
      excel.cell(row, 2).split(';').map { |i| parse_date(i + ".#{year}") }
    end

    def year
      @year ||= excel.cell(1,1).match(/\d{4}/).to_s
    end
  end
end
