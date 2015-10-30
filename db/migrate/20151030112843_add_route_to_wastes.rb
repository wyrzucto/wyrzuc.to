class AddRouteToWastes < ActiveRecord::Migration
  def change
    add_reference :wastes, :route, index: true
    add_column :wastes, :position, :integer
    add_index :wastes, :position
    
    Waste.update_all('position = id')
  end
end
