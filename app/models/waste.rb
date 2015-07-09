class Waste < ActiveRecord::Base

  include Addressable

  validates :street, :kind, :latitude, :longitude, presence: true

  geocoded_by :full_address
  before_validation :geocode

  serialize :data

  scope :pharmacies,         -> { where(kind: 1) }
  scope :hazardous_wastes,   -> { where(kind: 2) }
  scope :packaging_wastes,   -> { where(kind: 3) }
  scope :wet_and_dry_wastes, -> { where(kind: 4) }
  scope :bulky_wastes,       -> { where(kind: 5) }
end
