module ImportData
  class WetAndDryWastes < Base

    def import
      Waste.wet_and_dry_wastes.delete_all
      
      sheets_names.each do |sheet_name|
        excel.sheet(sheet_name)
        (4..excel.last_row).each do |row|
          next if excel.cell(row, 2).nil?

          if excel.row(row)[4..21].compact.any?
            waste = Waste.new(data(row))
            LogActivity.save(waste) unless waste.save
          end
        end
      end
    end

    private

    def data(row)
      {
        kind: 4,
        group_id: group_id,
        street: clean_street(excel.cell(row, 2)),
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
      if params[:area] == 'area_5'
        ['Jednorodzinne', 'Wielolokalowe']
      else
        ['jedno', 'wielolok']
      end
    end
  end
end
