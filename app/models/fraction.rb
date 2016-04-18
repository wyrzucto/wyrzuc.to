# This class describe single fraction object
class Fraction < ActiveRecord::Base
  belongs_to_active_hash :waste_data
  has_many :phrases
end
