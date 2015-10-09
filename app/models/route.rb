class Route < ActiveRecord::Base
  has_many :route_containers, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true

  def to_s
    self.name
  end
end
