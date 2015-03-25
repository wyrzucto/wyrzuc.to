module Geolocations
  module HazardousWastesPresenter
    module_function

    def to_json
      HazardousWaste.pluck(:street, :latitude, :longitude)
    end
  end
end
