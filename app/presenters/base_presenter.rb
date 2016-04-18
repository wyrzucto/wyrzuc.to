# Provides shared behaviour for all presenters
class BasePresenter
  attr_reader :street, :count, :kind

  def initialize(street, count, kind = nil)
    @street = street
    @count  = count
    @kind   = kind
  end

  private

  def coordinates
    location = Location.get_by_address(street)
    location ? [location.lat, location.lng] : []
  end
end
