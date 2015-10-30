class AddDescriptionToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :description, :text
  end
end
