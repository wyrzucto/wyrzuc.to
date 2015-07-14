class BasePresenter

  def initialize(street, count, kind=nil)
    @street = street
    @count  = count
    @kind   = kind
  end

  private
  attr_reader :street, :count, :kind

  def coordinates
    if location = Location.get_by_address(street)
      [ location.lat, location.lng ]
    else
      []
    end
  end
end
