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
    Pharmacy.near(street).first(count)
  end

  def parse_date(item)
    item.data[:date].map! { |date| Date.parse(date) }.select { |date| date >= Date.today }
  end

  def parse_data(item, date)
    {
      title:  I18n.t('sidebar.titles.pharmacy'),
      street: item.street,
      date:   date
    }
  end
end
