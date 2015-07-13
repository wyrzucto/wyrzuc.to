class AddDateToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :date, :date
  end
end
