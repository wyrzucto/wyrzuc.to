class CreateRouteContainers < ActiveRecord::Migration
  def change
    create_table :route_containers do |t|
      t.references :route, index: true
      t.references :waste, index: true

      t.timestamps
    end
  end
end
