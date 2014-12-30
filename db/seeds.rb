# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "ZUT - Zbiorka selektywna.."
CSV.foreach('public/dane_miejskie/kolorowe_smietniki.csv') do |row|
    Kolorowe.create(
    	ulica: row[2].to_s,
    	numer: row[3].to_s,
    	opis: row[4].to_s)
end

puts "ZDiZ - Zbiorka smieci komunalnych.."
CSV.foreach('public/dane_miejskie/zdiz_komunalka/sektor6.csv') do |row|
    ulicas = row[0].to_s
    ulica = row[1].to_s
    nr_domu = row[2].to_s
    dzielnica = row[3].to_s
    suche1 = row[4].to_s
    suche2 = row[5].to_s
    suche3 = row[6].to_s
    suche4 = row[7].to_s
    suche5 = row[8].to_s
    suche6 = row[9].to_s
    mokre1 = row[10].to_s
    mokre2 = row[11].to_s
    mokre3 = row[12].to_s
    mokre4 = row[13].to_s
    mokre5 = row[14].to_s
    mokre6 = row[15].to_s
    mieszane1 = row[16].to_s
    mieszane2 = row[17].to_s
    mieszane3 = row[18].to_s
    mieszane4 = row[19].to_s
    mieszane5 = row[20].to_s
    mieszane6 = row[21].to_s
    Pet.create(ulicas: ulicas,ulica: ulica,nr_domu: nr_domu,dzielnica: dzielnica, suche1: suche1,suche2: suche2,suche3: suche3,suche4: suche4,suche5: suche5,suche6: suche6,mokre1: mokre1,mokre2: mokre2,mokre3: mokre3,mokre4: mokre4,mokre5: mokre5,mokre6: mokre6,mieszane1: mieszane1,mieszane2: mieszane2,mieszane3: mieszane3,mieszane4: mieszane4,mieszane5: mieszane5,mieszane6: mieszane6)
end
