class HazardousWastesInfoPresenter < BasePresenter

  def data
    hazardous_wastes.inject([]) do |result, item|
      parse_date(item).each do |date|
        result << parse_data(item, date)
      end
      result
    end
  end

  private

  def hazardous_wastes
    Waste.hazardous_wastes.near(street).first(count)
  end

  def parse_date(item)
    item.data[:date].map! { |date| Date.parse(date) }.select { |date| date >= Date.today }
  end

  def parse_data(item, date)
    {
      title:  I18n.t('sidebar.titles.hazardous_wastes'),
      id:     item.id,
      date:   date
    }
  end
end
