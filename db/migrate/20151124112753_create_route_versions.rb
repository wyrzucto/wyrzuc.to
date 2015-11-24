class CreateRouteVersions < ActiveRecord::Migration
  def change
    create_table :route_versions do |t|
      t.references :route, index: true
      t.text :data

      t.timestamps
    end
  end
end
