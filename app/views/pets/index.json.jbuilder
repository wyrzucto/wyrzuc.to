json.array!(@pets) do |pet|
  json.extract! pet, :id, :ulicas, :ulica, :nr_domu, :dzielnica, :suche1, :suche2, :suche3, :suche4, :suche5, :suche6, :mokre1, :mokre2, :mokre3, :mokre4, :mokre5, :mokre6, :mieszane1, :mieszane2, :mieszane3, :mieszane4, :mieszane5, :mieszane6, :nie_odebrane, :typ
  json.url pet_url(pet, format: :json)
end
