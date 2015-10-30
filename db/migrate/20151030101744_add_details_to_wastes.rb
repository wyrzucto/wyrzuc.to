class AddDetailsToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :details, :text
  end
end
