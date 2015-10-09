class PackagingWastesInfoPresenter < BasePresenter

  def data
    packaging_wastes.inject([]) do |result, item|
      item.data[:weekday].keys.each do |key|
        weekdays = item.data[:weekday][key] - [ nil ]
        weekdays.each do |weekday|
          result << parse_data(item, weekday, key)
        end
      end
      result
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
