class AddAreaIdToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :area_id, :integer
  end
end
