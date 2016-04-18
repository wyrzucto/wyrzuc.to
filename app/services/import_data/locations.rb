module ImportData
  # This class provides methods that allow you to import information about locations
  class Locations < Base
    def import
      Location.delete_all

      json[:features].each do |row|
        Location.create(data(row))
      end
    end

    private

    def data(row)
      {
        street: row[:properties][:NAZWA_ULIC].mb_chars.titleize,
        number: row[:properties][:NUMER_DOMU],
        lng: row[:geometry][:coordinates][0],
        lat: row[:geometry][:coordinates][1]
      }
    end
  end
end
