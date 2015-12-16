class RemoveAreaIdFromRoutes < ActiveRecord::Migration
  def change
    remove_column :routes, :area_id, :integer
  end
end
