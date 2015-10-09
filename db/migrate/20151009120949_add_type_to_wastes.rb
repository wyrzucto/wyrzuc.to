class AddTypeToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :type, :string
    Waste.where(kind: 6).update_all(type: 'Wastes::BatteryCollectionPoint')
    Waste.where(kind: 3).update_all(type: 'Wastes::PackagingWaste')
  end
end
