# This class describe single static page object
class StaticPage < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def to_param
    id.to_s
  end
end
