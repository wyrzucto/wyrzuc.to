class Location < ActiveRecord::Base
  before_save :update_full_address

  default_scope { order(:street, :number_int)}

  def self.parse_numbers(street, numbers)
    parts = numbers.split(/[,;]/).map(&:strip).compact
    parts.map! { |part| parse_single_number(street, part) }
    parts.flatten.uniq
  end

  def self.parse_single_number(street, number)
    odd = even = false
    first = 0
    last = 100_000
    step = 1

    if number =~ /nieparz/
      odd = true
      step = 2
    elsif number =~ /parz/
      even = true
      step = 2
    end

    if m = number.match(/(\d+)-(\d+)/)
      first, last = m[1].to_i, m[2].to_i
    else
      first = last = number.to_i
      number.to_i
    end

    if number =~ /konca|końca/
      last = 100_000 
    elsif m = number.match(/do\s+(\d+)/)
      first = 0
      last = m[1].to_i
    end
      
    locations = Location.where(street: street, number_int: first..last)
    if odd
      locations = locations.where('number_int % 2 = 1')
    elsif even
      locations = locations.where('number_int % 2 = 0')
    end
    locations.pluck(:number)
  end

  def self.get_by_address(address)
    Location.find_by(full_address: address)
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
