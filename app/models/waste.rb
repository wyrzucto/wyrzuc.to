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

  def pretty_date
    if self.date
      d = I18n.l(self.date, format: "%A, %d %B %Y")
      d += "\nw godzinach #{self.data[:hour]}" if self.data[:hour].present?
    end
  end
end
