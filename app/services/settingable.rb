module Settingable
  def [](name)
    if @values.member?(name)
      get_value(name)
    elsif @defaults.member?(name)
      get_default(name)
    end
  end

  def configure(name, value, type)
    @values ||= HashWithIndifferentAccess.new
    @defaults ||= HashWithIndifferentAccess.new
    @defaults[name.to_s] = { value: value, type: type }
  end

  def get_type(name)
    if @defaults.member?(name.to_s)
      @defaults[name.to_s][:type]
    else
      nil
    end
  end

  def input_type(name)
    case get_type(name)
      when :integer then :number
      when :boolean then :boolean
      when :text then :text
      else :string
    end
  end

  def names
    @defaults.keys
  end

  def load!
    @values = HashWithIndifferentAccess.new
    all.each do |config_value|
      value = config_value.value
      value = case get_type(config_value.name)
        when :integer then value.to_i 
        when :boolean then value == 'true' || value == '1' || value == 't'
        else value
      end
      @values[config_value.name] = value
    end
  end

  def get_value(name)
    @values[name]
  end

  def get_default(name)
    @defaults[name].try(:[], :value)
  end

  def update_setting(name, value)
    Setting.find_or_create_by(name: name).update_attribute(:value, value)
    @values[name] = value
  end
end