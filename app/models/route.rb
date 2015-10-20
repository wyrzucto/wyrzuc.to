class Route < ActiveRecord::Base
  has_many :route_containers, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :area_id, presence: true, numericality: {in: :area_list}

  def self.area_list
    (1..22).map {|inx| ["Rejon #{inx}", inx] }
  end

  def area
    "Rejon #{self.area_id}" if self.area_id
  end

  def to_s
    self.name
  end
end
