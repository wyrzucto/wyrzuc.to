module ImportData
  # This class provides methods that allow you to import information about pharmacies
  class Pharmacies < Base
    attr_reader :date_cols_inx,
      :street_col_inx,
      :name_col_inx,
      :phone_col_inx,
      :postcode_col_inx

    # rubocop:disable all
    def import
      pharmacies.delete_all if pharmacies.any?

      if header_row = (1..excel.last_row).find { |x| excel.cell(x, 1) == 'Nazwa apteki' }
        header_row = excel.header_row(header_row)
        @street_col_inx = header_row.index('Ulica') + 1
        @name_col_inx = header_row.index('Nazwa apteki') + 1
        @postcode_col_inx = header_row.index('Telefon')
        @phone_col_inx = header_row.index('Telefon') + 1

        @date_cols_inx =
          (1...header_row.size).find_all { |x| header_row[x] == 'Data Odb.' }.map(&:succ)

        (excel.first_row..excel.last_row).each do |row|
          next if excel.font(row, 1).bold? || excel.cell(row, 1).nil?
          waste = Waste.new(data(row))
          LogActivity.save(waste) unless waste.save
        end
      end
    end
    # rubocop:enable all

    private

    def pharmacies
      @pharmacies ||= Waste.pharmacies
    end

    def dates(row)
      date_cols_inx.map { |inx| excel.cell(row, inx).to_date }.select { |date| date > Time.now }
    end

    def data(row)
      future_dates = dates(row)
      {
        kind: 1,
        street: clean_street(excel.cell(row, street_col_inx)),
        date: future_dates.first,
        data: {
          info: excel.cell(row, name_col_inx),
          name: excel.cell(row, name_col_inx),
          post_code: excel.cell(row, postcode_col_inx),
          phone_number: excel.cell(row, phone_col_inx),
          date: future_dates
        }
      }
    end
  end
end
