class Waste < ActiveRecord::Base

  include Addressable

  geocoded_by :full_address
  after_validation :geocode

  serialize :data

  scope :pharmacies,         -> { where(kind: 1) }
  scope :hazardous_wastes,   -> { where(kind: 2) }
  scope :packaging_wastes,   -> { where(kind: 3) }
  scope :wet_and_dry_wastes, -> { where(kind: 4) }
end
