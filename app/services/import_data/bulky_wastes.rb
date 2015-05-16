module ImportData
  class BulkyWastes < Base

    def import
      bulky_wastes.delete_all if bulky_wastes.any?
      (4..excel.last_row).each do |row|
        Waste.create(data(row, 1)) if excel.cell(row, 1).present?
        Waste.create(data(row, 2)) if excel.cell(row, 4).present?
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
          street: clean_street(excel.cell(row, 1)),
          data: {
            info: excel.cell(row, 1),
            group_name: 'Jednorodzinne',
            date: parse_date(row)
          }
        }
      else
        {
          kind: 5,
          street: clean_street(excel.cell(row, 4)),
          data: {
            info: excel.cell(row, 4),
            group_name: 'Wielolokalowe',
            weekday: parse_weekday(row)
          }
        }
      end
    end

    def parse_weekday(row)
      excel.cell(row, 5).split(',')
    end

    def parse_date(row)
      excel.cell(row, 2).split(';').map { |i| i << ".#{year}" }
    end

    def year
      @year ||= excel.cell(1,1).match(/\d{4}/).to_s
    end
  end
end
