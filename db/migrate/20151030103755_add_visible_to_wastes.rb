class AddVisibleToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :visible, :boolean, default: true
  end
end
