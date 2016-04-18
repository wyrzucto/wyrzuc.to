# Presenter used to present PackagingWastesInfo objects
class PackagingWastesInfoPresenter < BasePresenter
  def data
    packaging_wastes.each_with_object([]) do |item, result|
      item.data[:weekday].keys.each do |key|
        weekdays = item.data[:weekday][key] - [nil]
        weekdays.each do |weekday|
          result << parse_data(item, weekday, key)
        end
      end
    end
  end

  private

  def packaging_wastes
    Wastes::PackagingWaste.near(coordinates).first(count)
  end

  def parse_data(item, weekday, key)
    {
      title:   I18n.t("sidebar.titles.packaging_wastes.#{key}"),
      id:      item.id,
      weekday: weekday
    }
  end
end
