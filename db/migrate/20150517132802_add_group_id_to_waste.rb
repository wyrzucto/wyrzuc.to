class AddGroupIdToWaste < ActiveRecord::Migration
  def change
    add_column :wastes, :group_id, :integer
  end
end
