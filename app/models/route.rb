class Route < ActiveRecord::Base
  has_many :route_containers, dependent: :destroy
  has_many :containers, -> { order(position: :asc) }, dependent: :nullify, class: Wastes::PackagingWaste
  
  validates :name, presence: true, uniqueness: true
  validates :area_id, presence: true, inclusion: {in: (1..22)}

  def self.area_list
    (1..22).map {|inx| ["Sektor #{inx}", inx] }
  end

  def area
    "Sektor #{self.area_id}" if self.area_id
  end

  def to_s
    self.name
  end
end
