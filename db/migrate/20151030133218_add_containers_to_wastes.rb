class AddContainersToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :clear_glass_containers, :integer, default: 0
    add_column :wastes, :colorful_glass_containers, :integer, default: 0
    add_column :wastes, :plastic_containers, :integer, default: 0
    add_column :wastes, :maculature_containers, :integer, default: 0
  end
end
