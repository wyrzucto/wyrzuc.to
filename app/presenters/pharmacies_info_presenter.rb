# Presenter used to present PharmaciesInfo objects
class PharmaciesInfoPresenter < BasePresenter
  def data
    pharmacies.each_with_object([]) do |item, result|
      parse_date(item).each do |date|
        result << parse_data(item, date)
      end
    end
  end

  private

  def pharmacies
    Waste.pharmacies.near(coordinates).first(count)
  end

  def parse_date(item)
    item.data[:date].map!(&:to_date).select { |date| date >= Date.today }
  end

  def parse_data(item, date)
    {
      title: I18n.t('sidebar.titles.pharmacy'),
      id:    item.id,
      date:  date
    }
  end
end
