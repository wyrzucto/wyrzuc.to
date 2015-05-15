module ImportData
  class WetAndDryWastes < Base

    def import
      wet_and_dry_wastes.delete_all if wet_and_dry_wastes.any?
      sheets_names.each do |sheet_name|
        excel.sheet(sheet_name)
        (4..excel.last_row).each do |row|
          Waste.create(data(row)) if excel.row(row)[4..21].compact.any?
        end
      end
    end

    private

    def wet_and_dry_wastes
      @wet_and_dry_wastes ||= Waste.wet_and_dry_wastes
    end

    def data(row)
      {
        kind: 4,
        street: clean_street(excel.cell(row, 2)),
        kind: kind_id,
        data: {
          info: excel.cell(row, 2),
          number: excel.cell(row, 3),
          area: excel.cell(row, 4),
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

    def kind_id
      excel.default_sheet.downcase.include?('jedno') ? 1 : 2
    end

    def sheets_names
      if params[:sector] == 'sector_5'
        ['Jednorodzinne', 'Wielolokalowe']
      else
        ['jedno', 'wielolok']
      end
    end
  end
end
