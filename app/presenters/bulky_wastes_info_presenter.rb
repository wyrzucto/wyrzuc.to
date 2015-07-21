class BulkyWastesInfoPresenter < BasePresenter

  def data
    all_data = []

    if kind == :weekday
      all_data += bulky_wastes(2).inject([]) do |result, item|
        parse_weekday(item).each do |weekday|
          result << {
            title:   I18n.t("sidebar.titles.bulky_wastes"),
            id:      item.id,
            weekday: weekday,
            label: item.data[:group_name],
          }
        end
        result.reject { |item| item[:weekday].nil? }
      end
    end

    if kind == :date
      all_data += bulky_wastes(1).inject([]) do |result, item|
        parse_date(item).each do |date|
          result << {
            title: I18n.t("sidebar.titles.bulky_wastes"),
            id:    item.id,
            date:  date,
            label: item.data[:group_name]
          }
        end
        result.reject { |item| item[:date].nil? }
      end
    end

    all_data
  end

  private

  def bulky_wastes(group_id)
    Waste.bulky_wastes.where(group_id: group_id).near(coordinates).first(count)
  end

  def parse_date(item)
    item.data[:date].select { |date| date >= Date.today }
  end

  def parse_weekday(item)
    item.data[:weekday]
  end
end
