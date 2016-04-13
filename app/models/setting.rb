# This class describe single setting object
class Setting < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true

  extend Settingable

  configure :site_name, 'Wyrzuc.to', :string
  configure :site_email, 'admin@wyrzuc.to', :string
  configure :hazardous_days_home, 12, :integer
end
Setting.load!
