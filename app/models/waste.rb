# This class describe single waste object
class Waste < ActiveRecord::Base
  include Addressable

  validates :street, :kind, :latitude, :longitude, presence: true

  geocoded_by :full_address
  before_validation :set_location, on: :create

  serialize :data

  scope :pharmacies,         -> { where(kind: 1) }
  scope :hazardous_wastes,   -> { where(kind: 2) }
  scope :packaging_wastes,   -> { where(kind: 3) }
  scope :wet_and_dry_wastes, -> { where(kind: 4) }
  scope :bulky_wastes,       -> { where(kind: 5) }
  scope :battery_points,          -> { where(type: 'Wastes::BatteryCollectionPoint') }

  def pretty_date
    return unless date
    d = I18n.l(date, format: '%A, %d %B %Y')
    d += "\nw godzinach #{data[:hour]}" if data[:hour].present?
    d
  end

  def packaging_types
    containers = data[:containers] || {}
    types = []
    types << 'Szkło bezbarwne' if containers[:clear_glass]
    types << 'Szkło kolorowe' if containers[:colorful_glass]
    types << 'Tworzywa sztuczne' if containers[:plastic]
    types << 'Makulatura' if containers[:maculature]
    types
  end

  def image_preview
    "<img src='#{picture.url}' alt='' style='max-width: 200px; max-height:150px'>" if picture?
  end
end
