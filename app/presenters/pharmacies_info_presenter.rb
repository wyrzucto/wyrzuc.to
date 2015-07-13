class PharmaciesInfoPresenter < BasePresenter

  def data
    pharmacies.inject([]) do |result, item|
      parse_date(item).each do |date|
        result << parse_data(item, date)
      end
      result
    end
  end

  private

  def pharmacies
    Waste.pharmacies.near(street).first(count)
  end

  def parse_date(item)
    item.data[:date].map! { |date| date.to_date }.select { |date| date >= Date.today }
  end

  def parse_data(item, date)
    {
      title: I18n.t('sidebar.titles.pharmacy'),
      id:    item.id,
      date:  date
    }
  end
end
