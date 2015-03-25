class PlacesNearLocationPresenter

  attr_reader :street, :count

  def initialize(params)
    @street = params[:user_location]
    @count  = params[:count] || 1
  end

  def coordinates
    Geocoder.coordinates(parsed_street)
  end

  def data
    places_for_weekdays + places_for_monthdays
  end

  private

  def places_for_weekdays
    (presenter(:packaging_wastes) + presenter(:wet_and_dry_wastes)).sort_by { |item| item[:weekday] }
  end

  def places_for_monthdays
    (presenter(:pharmacies) + presenter(:hazardous_wastes)).sort_by { |item| item[:date] }
  end

  def presenter(kind)
    "#{kind.to_s.camelcase}InfoPresenter".constantize.new(parsed_street, count).data
  end

  def parsed_street
    "#{street}, Gdańsk, Poland"
  end
end
