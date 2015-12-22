class Wastes::PackagingWaste < Waste

  belongs_to :district
  belongs_to :route

  acts_as_list scope: :route_id
  mount_uploader :picture, PlaceUploader

  validates :street_name, presence: true, if: "street.blank?"
  validates :street_number, presence: true, if: "street.blank?"

  before_validation :set_kind

  CONTAINER_TYPES = [
    'Janko', 'Dzwon', 'Titan', 'Piłka', 'JFC'
  ]


  def to_s
    self.street
  end

  def set_kind
    self.kind = 3
  end

  def uploaded_picture=(file)
    self.picture = file.read
  end

  def packaging_types
    types = []
    types << 'Szkło bezbarwne' if self.clear_glass_containers > 0
    types << 'Szkło kolorowe' if self.colorful_glass_containers > 0
    types << 'Tworzywa sztuczne' if self.plastic_containers > 0
    types << 'Makulatura' if self.maculature_containers > 0
    types
  end

  attr_accessor :street_name, :street_number

  def street_name
    return @street_name if @street_name
    parts = street.to_s.split(/\s+/)
    parts = parts[0, parts.size-1]
    parts.present? ? parts.join(' ') : nil
  end

  def street_number
    @street_number || street.to_s.split(/\s+/).last
  end

end

