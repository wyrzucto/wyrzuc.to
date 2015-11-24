class RouteVersion < ActiveRecord::Base
  belongs_to :route

  serialize :data


  def self.export_route(route)
    data = route.containers.map { |container| { id: container.id, address: container.street } }

    route.route_versions.create(data: data)
  end

  def container_ids
    self.data.map { |c| c[:id] }
  end
end
