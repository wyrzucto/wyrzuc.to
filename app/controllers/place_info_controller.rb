class PlaceInfoController < ApplicationController

  def show
    @place_info = Waste.select(:id, :data, :latitude, :longitude).where('id = ?', params[:id]).first
  end
end
