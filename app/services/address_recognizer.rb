module AddressRecognizer
  def parse_numbers(street, numbers)
    street = street.mb_chars.downcase.sub(/ul.\s+/i, '')
    parts = numbers.split(/[,;]/).map(&:strip).compact.uniq
    parts = [ '' ] if parts == []
    parts.map! { |part| parse_single_number(street, part) }
    parts.flatten.uniq
  end

  private

    def parse_single_number(street, number)
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
      elsif number != ''
        first = last = number.to_i
        number.to_i
      end
      if number =~ /konca|końca/
        last = 100_000 
      elsif m = number.match(/do\s+(\d+)/)
        first = 0
        last = m[1].to_i
      end
      p last
      locations = Location.where(street: street, number_int: first..last)
      if odd
        locations = locations.where('number_int % 2 = 1')
      elsif even
        locations = locations.where('number_int % 2 = 0')
      end
      locations
    end
end