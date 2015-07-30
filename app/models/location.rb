class Location < ActiveRecord::Base
  before_save :update_full_address

  default_scope { order(:street, :number_int)}

  extend AddressRecognizer

  def self.get_by_address(address)
    address = address.mb_chars.downcase.strip
    Location.find_by('LOWER(full_address) IN (?)', [address, address + 'a', 'aleja ' + address, 'aleja ' + address + 'a'])  
  end

  def self.areas_combo
    [ 'area1', 'area2', 'area3', 'area4', 'area5', 'area6' ]
  end

  private
    def update_full_address
      if self.street_changed? || self.number_changed?
        self.full_address = [ self.street, self.number ].compact.join(' ')
    end
    if self.number_changed?
      self.number_int = self.number.to_i
    end
  end
end
