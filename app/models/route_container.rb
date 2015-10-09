class RouteContainer < ActiveRecord::Base
  belongs_to :route
  belongs_to :waste

  validates :route, presence: true
  validates :waste, presence: true, uniqueness: { scope: :route_id }
end
