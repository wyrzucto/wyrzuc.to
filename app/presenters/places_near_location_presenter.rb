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
    (get_data(:packaging_wastes) + get_data(:wet_and_dry_wastes)).sort_by { |item| item[:weekday] }
  end

  def places_for_monthdays
    (get_data(:pharmacies) + get_data(:hazardous_wastes)).sort_by { |item| item[:date] }
  end

  def get_data(kind)
    "#{kind.to_s.camelcase}InfoPresenter".constantize.new(parsed_street, count).data
  end

  def parsed_street
    "#{street}, Gdańsk, Poland"
  end
end
