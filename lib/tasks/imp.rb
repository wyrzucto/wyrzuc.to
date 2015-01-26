class Imp < ActiveRecord::Base
def impo
spreadsheet = Roo::Excelx.new("./public/s5.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).each do |i|
a = spreadsheet.cell(i,1)
b = spreadsheet.cell(i,2)
c = spreadsheet.cell(i,3)
d = spreadsheet.cell(i,4).to_s
e = spreadsheet.cell(i,5)
case d
when "1.0" then Bin.create(ul: a,ulica: b,suche: 'poniedzialek',mokre: 'poniedzialek',dzielnica: e)
when "2.0" then Bin.create(ul: a,ulica: b,suche: 'wtorek',mokre: 'wtorek',dzielnica: e)
when "3.0" then Bin.create(ul: a,ulica: b,suche: 'środa',mokre: 'sroda',dzielnica: e)
when "4.0" then Bin.create(ul: a,ulica: b,suche: 'czwartek',mokre: 'czwartek',dzielnica: e)
when "5.0" then Bin.create(ul: a,ulica: b,suche: 'piatek',mokre: 'piatek',dzielnica: e)
when "6.0" then Bin.create(ul: a,ulica: b,suche: 'sobota',mokre: 'sobota',dzielnica: e)
end
  end
 spreadsheet = Roo::Excelx.new("./public/h1.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).each do |i|
Select.create(ulica: spreadsheet.cell(i,3))
end
end
end
end
