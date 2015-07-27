module ImportData
  class WetAndDryWastes < Base

    def import
      # Waste.wet_and_dry_wastes.delete_all
      
      sheets_names.each do |sheet_name|
        excel.sheet(sheet_name)
        (4..excel.last_row).each do |row|
          next if excel.cell(row, 1).nil?

          if excel.row(row)[4..21].compact.any?
            locations_by_street = locations(row)
	    if locations_by_street.empty?
	      LogActivity.save("Nie odnaleziono lokalizacji dla rekordu '#{excel.cell(row, 1)} #{excel.cell(row, 3).to_s}'")
	    end

            locations_by_street.each do |location|
              waste = Waste.new(data(row, location))
              LogActivity.save(waste) unless waste.save
            end
          end
        end
      end
    end

    private

    def data(row, location)
      {
        kind: 4,
        group_id: group_id,
        street: location.full_address,
        location: location,
        data: {
          info: excel.cell(row, 2),
          number: excel.cell(row, 3),
          area: excel.cell(row, 4),
          group_name: group_name,
          weekday: {
            dry: weekday(row, 5),
            wet: weekday(row, 11),
            mixed: weekday(row, 17)
          }
        }
      }
    end

    def locations(row)
      Location.parse_numbers(excel.cell(row, 1), excel.cell(row, 3).to_s)

    end

    def weekday(row, waste_col)
      (1..6).inject([]) do |result, col|
        result << col if excel.cell(row, (col+waste_col-1)).present?
        result
      end
    end

    def group_name
      excel.default_sheet.downcase.include?('jedno') ? 'Jednorodzinne' : 'Wielolokalowe'
    end

    def group_id
      group_name == 'Jednorodzinne' ? 1 : 2
    end

    def sheets_names
        ['jedno', 'wielolok']
    end
  end
end
