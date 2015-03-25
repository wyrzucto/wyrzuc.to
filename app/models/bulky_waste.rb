class BulkyWaste < ActiveRecord::Base
  include Addressable

  geocoded_by :full_address
  after_validation :geocode

  serialize :data
end
