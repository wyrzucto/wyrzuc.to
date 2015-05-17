class BulkyWastesInfoPresenter < BasePresenter

  def data
    all_data = []

    if kind == :weekday
      all_data += bulky_wastes(2).inject([]) do |result, item|
        parse_weekday(item).each do |weekday|
          result << {
            title:   I18n.t("sidebar.titles.bulky_wastes"),
            id:      item.id,
            weekday: weekday
          }
        end
        result
      end
    end

    if kind == :date
      all_data += bulky_wastes(1).inject([]) do |result, item|
        parse_date(item).each do |date|
          result << {
            title: I18n.t("sidebar.titles.bulky_wastes"),
            id:    item.id,
            date:  date
          }
        end
        result
      end
    end

    all_data
  end

  private

  def bulky_wastes(group_id)
    Waste.bulky_wastes.where(group_id: group_id).near(street).first(count)
  end

  def parse_date(item)
    item.data[:date].map! { |date| Date.parse(date) }.select { |date| date >= Date.today }
  end

  def parse_weekday(item)
    item.data[:weekday]
  end
end
