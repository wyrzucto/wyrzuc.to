module ImportData
  class Phrases < Base

    def import
      excel.sheet('Arkusz1')
      (1..5).each do |col|
        (2..excel.last_row).each do |row|
          next if excel.cell(row, col).nil? || phrase_exist?(row, col)
          Phrase.create(data(row, col))
        end
      end
    end

    private

    def phrase_exist?(row, col)
      all_phrases.where(name: excel.cell(row, col)).any?
    end

    def all_phrases
      @all_phrases ||= Phrase.all
    end

    def data(row, col)
      {
        name: excel.cell(row, col),
        fraction_id: fraction(col).id,
      }
    end

    def fraction(col)
      Fraction.find_or_create_by(fraction_data[col])
    end

    def fraction_data
      {
        1 => {
          name: 'odpady mokre, suche, zmieszane',
          waste_data_id: WasteData.find_by_kind('wet_and_dry_wastes').id
        },
        2 => {
          name: 'odpady opakowaniowe',
          waste_data_id: WasteData.find_by_kind('packaging_wastes').id
        },
        3 => {
          name: 'odpady niebezpieczne',
          waste_data_id: WasteData.find_by_kind('hazardous_wastes').id
        },
        4 => {
          name: 'apteki',
          waste_data_id: WasteData.find_by_kind('pharmacies').id
        },
        5 => {
          name: 'odpady niebezpieczne',
          waste_data_id: WasteData.find_by_kind('bulky_wastes').id
        }
      }
    end
  end
end
