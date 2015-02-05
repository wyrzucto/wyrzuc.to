module ImportData
  module_function

  def import
    create_streets
    create_bin_location
  end

  def create_streets
    (2..streets.last_row).each do |i|
      a = streets.cell(i,1)
      b = streets.cell(i,2)
      c = streets.cell(i,3)
      d = streets.cell(i,4).to_s
      e = streets.cell(i,5)
      case d
      when "1.0" then Bin.create(ul: a,ulica: b,suche: 'poniedzialek',mokre: 'poniedzialek',dzielnica: e)
      when "2.0" then Bin.create(ul: a,ulica: b,suche: 'wtorek',mokre: 'wtorek',dzielnica: e)
      when "3.0" then Bin.create(ul: a,ulica: b,suche: 'środa',mokre: 'sroda',dzielnica: e)
      when "4.0" then Bin.create(ul: a,ulica: b,suche: 'czwartek',mokre: 'czwartek',dzielnica: e)
      when "5.0" then Bin.create(ul: a,ulica: b,suche: 'piatek',mokre: 'piatek',dzielnica: e)
      when "6.0" then Bin.create(ul: a,ulica: b,suche: 'sobota',mokre: 'sobota',dzielnica: e)
      end
    end
  end

  def create_bin_location
    (2..bin_location.last_row).each do |i|
      Select.create(ulica: bin_location.cell(i,3))
    end
  end

  def streets
    @spreadsheet ||= Roo::Excelx.new("./public/s5.xlsx")
  end

  def bin_location
    @spreadsheet_2 ||= Roo::Excelx.new("./public/h1.xlsx")
  end
end
