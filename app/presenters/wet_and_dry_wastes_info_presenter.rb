class WetAndDryWastesInfoPresenter < BasePresenter

  def data
    wet_and_dry_wastes.inject([]) do |result, item|
      item.data[:weekday].keys.each do |key|
        item.data[:weekday][key].each do |weekday|
          result << parse_data(item, weekday, key)
        end
      end
      result
    end
  end

  private

  def wet_and_dry_wastes
    Waste.wet_and_dry_wastes.where(street: @street)
  end

  def parse_data(item, weekday, key)
    {
      title:   I18n.t("sidebar.titles.wet_and_dry_wastes.#{key}"),
      id:      item.id,
      weekday: weekday,
      label: item.data[:group_name],
    }
  end
end
