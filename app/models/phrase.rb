class Phrase < ActiveRecord::Base

  belongs_to :fraction

  validates :name, presence: true, uniqueness: true

  def parsed_description
    if fraction.try(:description).nil?
      I18n.t('description.default_description')
    else
      fraction.description.gsub(/\{\{.*\}\}/, name)
    end
  end
end
