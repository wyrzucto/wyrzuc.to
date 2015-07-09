class StaticPage < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def to_param
    self.id.to_s
  end
end
