module ImportData
  class Pharmacies < Base

    def import
      Pharmacy.delete_all if Pharmacy.any?
      (excel.first_row..excel.last_row).each do |row|
        next if excel.font(row, 1).bold? || excel.cell(row, 1).nil?
        Pharmacy.create(data(row))
      end
    end

    private

    def data(row)
      {
        street: clean_street(excel.cell(row, 2)),
        data: {
          info: excel.cell(row, 2),
          name: excel.cell(row, 1),
          post_code: excel.cell(row, 10),
          phone_number: excel.cell(row, 11),
          date: [
            parse_date(excel.cell(row, 3)),
            parse_date(excel.cell(row, 4)),
            parse_date(excel.cell(row, 5)),
            parse_date(excel.cell(row, 6)),
            parse_date(excel.cell(row, 7)),
            parse_date(excel.cell(row, 8))
          ]
        }
      }
    end
  end
end
