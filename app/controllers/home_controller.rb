class HomeController < ApplicationController

  before_action :save_user_location, only: :search_places

  autocomplete :waste, :street, scopes: [:uniq]

  autocomplete :phrase, :name

  def show; end

  def search_places
    @presenter = PlacesNearLocationPresenter.new(form_params)
  end

  def fraction_description
    @phrase = Phrase.find_or_create_by(name: params[:phrase])
  end

  def fractions_places
    @waste_name = params[:waste_name]
  end

  private

  def save_user_location
    session[:user_location] = form_params[:user_location]
  end

  def form_params
    params.permit(:user_location, :count)
  end
end
