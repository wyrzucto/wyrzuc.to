# This class describe single location object
class Location < ActiveRecord::Base
  before_save :update_full_address

  default_scope { order(:street, :number_int) }

  extend AddressRecognizer

  def self.get_by_address(address)
    address = address.mb_chars.downcase.strip
    Location.find_by(
      'LOWER(full_address) IN (?)',
      [
        address, address + 'a',
        'aleja ' + address,
        'aleja ' + address + 'a'
      ]
    )
  end

  def self.areas_combo
    %w( area1 area2 area3 area4 area5 area6 )
  end

  def self.street_list
    Location.distinct.reorder(:street).pluck(:street)
  end

  private

  def update_full_address
    [street, number].compact.join(' ') if street_changed? || number_changed?
    self.number_int = number.to_i if number_changed?
  end
end
