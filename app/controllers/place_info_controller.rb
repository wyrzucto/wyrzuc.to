# This class provides actions for handling places information
class PlaceInfoController < ApplicationController
  def show
    @place_info =
      Waste
      .select(:id, :data, :latitude, :longitude)
      .where('id = ?', params[:id])
      .first
  end

  def all_places
    @all_places =
      Waste
      .send(params[:kind])
      .select(:id, :street, :latitude, :longitude)
      .order(:street)
  end

  def mobile_map
    @css_class = 'map'
    @place = Waste.where(id: params[:id]).first
  end
end
