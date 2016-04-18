# Presenter used to present HazardousWastesInfo objects
class HazardousWastesInfoPresenter < BasePresenter
  def data
    hazardous_wastes.each_with_object([]) do |item, result|
      parse_date(item).each do |date|
        result << parse_data(item, date)
      end
    end
  end

  private

  def hazardous_wastes
    Waste.hazardous_wastes.near(coordinates).first(count)
  end

  def parse_date(item)
    item.data[:date].map!(&:to_date).select { |date| date >= Date.today }
  end

  def parse_data(item, date)
    {
      title:  I18n.t('sidebar.titles.hazardous_wastes'),
      id:     item.id,
      date:   date
    }
  end
end
