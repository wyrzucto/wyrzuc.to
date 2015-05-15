class GeolocationsController < ApplicationController

  def pharmacies
    render_json
  end

  def wet_and_dry_wastes
    render_json
  end

  def hazardous_wastes
    render_json
  end

  def bulky_wastes
    render_json
  end

  def packaging_wastes
    render_json
  end

  private

  def render_json
    render json: Waste.send(action_name).pluck(:street, :latitude, :longitude)
  end
end
