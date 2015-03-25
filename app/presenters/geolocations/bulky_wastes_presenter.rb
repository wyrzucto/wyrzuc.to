module Geolocations
  module BulkyWastesPresenter
    module_function

    def to_json
      BulkyWaste.pluck(:street, :latitude, :longitude)
    end
  end
end
