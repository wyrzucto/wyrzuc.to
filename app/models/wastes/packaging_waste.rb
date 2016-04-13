# This class describe single waste packaging object
class Wastes::PackagingWaste < Waste
  belongs_to :district
  belongs_to :route

  acts_as_list scope: :route_id
  mount_uploader :picture, PlaceUploader

  validates :street_name, presence: true, if: 'street.blank?'

  before_validation :set_kind

  CONTAINER_TYPES = %w( Janko Dzwon Titan Piłka JFC podziemny).freeze

  def to_s
    street
  end

  def set_kind
    self.kind = 3
  end

  def uploaded_picture=(file)
    self.picture = file
  end

  def packaging_types
    types = []
    types << 'Szkło bezbarwne' if clear_glass_containers > 0
    types << 'Szkło kolorowe' if colorful_glass_containers > 0
    types << 'Tworzywa sztuczne' if plastic_containers > 0
    types << 'Makulatura' if maculature_containers > 0
    types
  end

  attr_accessor :street_name, :street_number

  def street_name
    return @street_name if @street_name
    parts = street.to_s.split(/\s+/)
    parts = parts[0, parts.size - 1]
    parts.present? ? parts.join(' ') : nil
  end

  def street_number
    @street_number || street.to_s.split(/\s+/).last
  end
end
