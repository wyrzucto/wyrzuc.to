class AddContainerTypeToWaste < ActiveRecord::Migration
  def change
    add_column :wastes, :container_type, :string
  end
end
