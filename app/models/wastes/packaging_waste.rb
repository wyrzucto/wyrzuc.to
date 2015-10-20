class Wastes::PackagingWaste < Waste

  belongs_to :district

  def packaging_types
    types = []
    types << 'Szkło bezbarwne' if containers?(:clear_glass)
    types << 'Szkło kolorowe' if containers?(:colorful_glass)
    types << 'Tworzywa sztuczne' if containers?(:plastic)
    types << 'Makulatura' if containers?(:maculature)
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

  def clear_glass_containers
    containers[:clear_glass] == true ? 1 : (containers[:clear_glass].try(:to_i) || 0)
  end

  def clear_glass_containers=(number)
    self.data ||= {}
    self.data[:containers] ||= {}
    self.data[:containers][:clear_glass_containers] = number
  end
  
  def colorful_glass_containers
    containers[:colorful_glass] == true ? 1 : (containers[:colorful_glass].try(:to_i) || 0)
  end
  
  def colorful_glass_containers=(number)
    self.data ||= {}
    self.data[:containers] ||= {}
    self.data[:containers][:colorful_glass_containers] = number
  end

  def plastic_containers
    containers[:plastic] == true ? 1 : (containers[:plastic].try(:to_i) || 0)
  end
  
  def plastic_containers=(number)
    self.data ||= {}
    self.data[:containers] ||= {}
    self.data[:containers][:plastic_containers] = number
  end
  
  def maculature_containers
    containers[:maculature] == true ? 1 : (containers[:maculature].try(:to_i) || 0)
  end

  def maculature_containers=(number)
    self.data ||= {}
    self.data[:containers] ||= {}
    self.data[:containers][:maculature_containers] = number
  end
  
  private
    def containers
      @containers ||= (self.data.try(:[], :containers) || {})
    end

    def containers?(type)
      containers[type] && (containers[type] == true || containers[type].to_i > 0)
    end
end

