class HomeController < ApplicationController

  before_action :save_user_location, only: :search_places

  def show; end

  def search_places
    @presenter = PlacesNearLocationPresenter.new(form_params)
  end

  private

  def save_user_location
    session[:user_location] = form_params[:user_location]
  end

  def form_params
    params.permit(:user_location, :count)
  end
end
