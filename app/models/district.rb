# This class describe single district object
class District < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
