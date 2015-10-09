class GeolocationsController < ApplicationController

  def pharmacies
    render_json
  end

  def wet_and_dry_wastes
    render_json
  end

  def hazardous_wastes
    data = Waste.hazardous_wastes.order(:date).where(date: Time.now..Setting[:hazardous_days_home].days.from_now).map do |waste|
      [ [ waste.street, waste.data[:info], waste.pretty_date ].compact.join("\n"), waste.latitude, waste.longitude ]
    end
    render json: data
  end

  def bulky_wastes
    render_json
  end

  def battery_points
    data = Wastes::BatteryCollectionPoint.map do |waste|
      [ [ waste.street, waste.data[:info] ].compact.join("\n"), waste.latitude, waste.longitude ]
    end
    render json: data
  end

  def packaging_wastes
    data = Wastes::PackagingWaste.map do |waste|
      [ ([ waste.street ] + waste.packaging_types).compact.join("\n"), waste.latitude, waste.longitude ]
    end
    render json: data
  end

  private

  def render_json
    render json: Waste.public_send(action_name).pluck(:street, :latitude, :longitude)
  end
end
