class Wastes::PackagingWaste < Waste

  belongs_to :district
  belongs_to :route

  acts_as_list scope: :route_id
  mount_uploader :picture, PlaceUploader

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
    parts = street.to_s.split(/\s+/)
    parts[0, parts.size-1]
  end

  def street_number
    street.to_s.split(/\s+/).last
  end

end

