module ImportData
  # This class provides methods that allow you to import information about hazardous wastes
  class HazardousWastes < Base
    attr_reader :date_col_inx,
      :street_col_inx,
      :street_no_col_inx,
      :arr_time_col_inx,
      :dep_time_col_inx,
      :description_col_inx

    # rubocop:disable all
    def import
      hazardous_wastes.delete_all if hazardous_wastes.any?
      sheet_inx = excel.sheets.index { |sheet| sheet == 'niebezpieczne' }
      excel.sheet(sheet_inx)

      first_row = excel.row(1)
      %w(Data Ulica Numer Godzina\ przyjazdu Godzina\ odjazdu Opis ).each do |colname|
        unless first_row.index(colname)
          raise KeyError, 'Nie znaleziono kolumny "' + colname + '" w pierwszym rzędzie danych'
        end
      end

      @date_col_inx = first_row.index('Data') + 1
      @street_col_inx = first_row.index('Ulica') + 1
      @street_no_col_inx = first_row.index('Numer') + 1
      @arr_time_col_inx = first_row.index('Godzina przyjazdu') + 1
      @dep_time_col_inx = first_row.index('Godzina odjazdu') + 1
      @description_col_inx = first_row.index('Opis') + 1

      (2..excel.last_row).each do |row|
        waste = Waste.new(data(row))
        LogActivity.save(waste) unless waste.save
      end
    end
    # rubocop:enable all

    private

    def hazardous_wastes
      @hazardous_wastes ||= Waste.hazardous_wastes
    end

    def dates(row)
      unless excel.cell(row, date_col_inx)
        LogActivity.save("Brak podanej daty w rzędzie #{row}")
        return nil
      end

      parsed = excel.cell(row, date_col_inx).split(' ').map { |date| parse_date(date).to_date }
      parsed.select { |date| date > Time.now }
    end

    def street(row)
      clean_street(excel.cell(row, street_col_inx))
    end

    def street_number(row)
      excel.cell(row, street_no_col_inx).to_i.to_s
    end

    def address(row)
      "#{street(row)} #{street_number(row)}"
    end

    def data(row)
      future_dates = dates(row)
      {
        kind: 2,
        date: future_dates.first,
        street: address(row),
        data: {
          info: excel.cell(row, description_col_inx).try(:sub, /^\((.*)\)$/, '\\1'),
          date: future_dates,
          hour: [
            I18n.l(Time.at(excel.cell(row, arr_time_col_inx)).utc, format: :hour),
            I18n.l(Time.at(excel.cell(row, dep_time_col_inx)).utc, format: :hour)
          ].join(' - ')
        }
      }
    end
  end
end
