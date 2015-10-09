module ImportData
  class PackagingWastes < Base

    attr_reader :street_col_inx, :street_no_col_inx, :description_col_inx, :clear_glass_col_inx, :colorful_glass_col_inx, :plastic_col_inx, :maculature_col_inx

    def import
      Wastes::PackagingWaste.delete_all
      
      row = address_sheet.row(3)
      @street_col_inx = row.index('Ulica') + 1
      @street_no_col_inx = row.index('Numer(y)') + 1
      @description_col_inx = row.index('Opis') + 1
      @clear_glass_col_inx = row.index('szkło bezbarwne') + 1
      @colorful_glass_col_inx = row.index('szkło kolorowe') + 1
      @maculature_col_inx = row.index('makulatura') + 1
      @plastic_col_inx = row.index('tworzywo sztuczne') + 1

      (4..address_sheet.last_row).each do |row|
        waste = Wastes::PackagingWaste.new(data(row))
        LogActivity.save(waste) unless waste.save
      end
    end

    private

    def address_sheet
      @sheet_addreses ||= excel.sheets.index {|sheet| sheet == 'spis lokalizacji - selektywna' }
      excel.sheet(@sheet_addreses)
    end

    def street_cell(row)
      clean_street(address_sheet.cell(row, 3))
    end

    def numbers_cell(row)
      address_sheet.cell(row, 4)
    end

    def address_cell(row)
      [ street_cell(row), numbers_cell(row) ].compact.join(' ')
    end

    def data(row)
      {
        kind: 3,
        street: address_cell(row),
        data: {
          info: excel.cell(row, description_col_inx),
          containers: {
            clear_glass: excel.cell(row, clear_glass_col_inx).to_i,
            colorful_glass: excel.cell(row, colorful_glass_col_inx).to_i,
            maculature: excel.cell(row, maculature_col_inx).to_i,
            plastic: excel.cell(row, plastic_col_inx).to_i,
          }
        }
      }
    end

  end
end
