class Fraction < ActiveRecord::Base

  belongs_to_active_hash :waste_data
  belongs_to :description
  has_many :phrases
end
