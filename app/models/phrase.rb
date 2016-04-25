# This class describe single phrase object
class Phrase < ActiveRecord::Base
  belongs_to :fraction

  validates :name, presence: true, uniqueness: true

  def parsed_description
    if fraction&.description
      fraction.description.gsub(/\{\{.*\}\}/, name)
    else
      I18n.t('description.default_description')
    end
  end
end
