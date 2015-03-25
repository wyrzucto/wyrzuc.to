module Geolocations
  module WetAndDryWastesPresenter
    module_function

    def to_json
      WetAndDryWaste.pluck(:street, :latitude, :longitude)
    end
  end
end
