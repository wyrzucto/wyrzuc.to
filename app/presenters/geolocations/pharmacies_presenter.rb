module Geolocations
  module PharmaciesPresenter
    module_function

    def to_json
      Pharmacy.pluck(:street, :latitude, :longitude)
    end
  end
end
