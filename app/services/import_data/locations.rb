module ImportData
  class Locations < Base

    def import
      locations.delete_all if locations.any?
      
      json[:features].each do |row|
        Location.create(data(row))
      end
    end

    private

    def locations
      @locations ||= Location.all
    end

    def data(row)
      {
        street: row[:properties][:NAZWA_ULIC].mb_chars.downcase.capitalize,
        number: row[:properties][:NUMER_DOMU],
        lat: row[:geometry][:coordinates][0],
        lng: row[:geometry][:coordinates][1],
      }
    end
  end
end
