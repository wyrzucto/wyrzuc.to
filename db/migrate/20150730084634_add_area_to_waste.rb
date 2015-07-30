class AddAreaToWaste < ActiveRecord::Migration
  def change
    add_column :wastes, :area, :string
  end
end
