class HomeController < ApplicationController

  before_action :save_user_location, only: :search_places

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

  def autocomplete_wastes
    render json: { data: Waste.where('street LIKE ?', "#{params[:term]}%").pluck(:street) }
  end

  def autocomplete_phrases
    render json: { data: Phrase.where.not(fraction_id: nil).where('name LIKE ?', "#{params[:term]}%").pluck(:name) }
  end

  def autocomplete_locations
    term = params[:term].to_s.downcase
    results = Location.where('LOWER(street) LIKE ?', "%#{term}%").limit(10).reorder(:street).uniq.pluck(:street)
    if results.count <= 1
      results = Location.where('LOWER(full_address) LIKE ?', "%#{term}%").pluck(:full_address)
    end
    render json: { data: results }
  end

  private

  def save_user_location
    session[:user_location] = form_params[:user_location]
  end

  def form_params
    params.permit(:user_location, :count)
  end
end
