module Addressable

  def full_address
    "#{street}, Gdańsk, Poland"
  end

  attr_accessor :location
  
  def set_location
    if location ||= Location.find_by(full_address: street)
      self.latitude = location.lat
      self.longitude = location.lng
    end
  end
end
