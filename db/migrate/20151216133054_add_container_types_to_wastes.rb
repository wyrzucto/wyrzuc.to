class AddContainerTypesToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :clear_glass_container_type, :string
    add_column :wastes, :colorful_glass_container_type, :string
    add_column :wastes, :plastic_container_type, :string
    add_column :wastes, :maculature_container_type, :string
    Waste.update_all(:clear_glass_container_type => 'Janko', :colorful_glass_container_type => 'Janko', :plastic_container_type => 'Janko', :maculature_container_type => 'Janko')
  end
end
