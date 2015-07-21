class PlacesNearLocationPresenter

  attr_reader :street, :count

  def initialize(params)
    @street = params[:user_location]
    @count  = params[:count] || 1

    address = @street.mb_chars.downcase
    @location = Location.find_by('LOWER(full_address) = ?', address) || Location.find_by('LOWER(street) = ?', address)
  end

  def coordinates
    [ @location.try(:lat), @location.try(:lng) ]
    # if location = Location.get_by_address(street)
    #   [ location.lat, location.lng ]
    # else
    #   []
    # end
  end

  def data
    places_for_weekdays + places_for_monthdays
  end

  def data_by_weekday
    places_for_weekdays.group_by { |item| item[:weekday] }
  end

  def places_for_monthdays
    (get_data(:hazardous_wastes) + get_data(:bulky_wastes, :date)).sort_by { |item| item[:date] }
  end

  private

  def places_for_weekdays
    (get_data(:wet_and_dry_wastes) + get_data(:bulky_wastes, :weekday)).sort_by { |item| item[:weekday] }
  end


  def get_data(name, kind=nil)
    "#{name.to_s.camelcase}InfoPresenter".constantize.new(parsed_street, count, kind).data
  end

  def parsed_street
    @location.full_address
    # "#{street}, Gdańsk, Poland"
  end
end
