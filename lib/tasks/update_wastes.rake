task update_wastes: :environment do
  Waste.pharmacies.find_each do |row|
    dates = row.data[:date].map(&:to_date).sort.select { |date| date > Time.now }
    row.date = dates.first
    row.data[:date] = dates
    row.save
  end

  Waste.hazardous_wastes.find_each do |row|
    dates = row.data[:date].map(&:to_date).sort.select { |date| date > Time.now }
    row.date = dates.first
    row.data[:date] = dates
    row.save
  end
end