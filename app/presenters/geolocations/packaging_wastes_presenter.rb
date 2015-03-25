module Geolocations
  module PackagingWastesPresenter
    module_function

    def to_json
      PackagingWaste.pluck(:street, :latitude, :longitude)
    end
  end
end
