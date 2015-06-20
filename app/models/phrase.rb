class Phrase < ActiveRecord::Base

  belongs_to :fraction

  def parsed_description
    if fraction.try(:description).nil?
      I18n.t('description.default_description')
    else
      fraction.description.description.gsub(/\{\{.*\}\}/, name)
    end
  end
end
