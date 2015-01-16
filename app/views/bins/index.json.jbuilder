json.array!(@bins) do |bin|
  json.extract! bin, :id, :ul, :ulica, :dzielnica, :numer, :suche, :mokre, :zmieszane, :latitude, :longitude
  json.url bin_url(bin, format: :json)
end
