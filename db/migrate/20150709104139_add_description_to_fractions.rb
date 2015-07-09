class AddDescriptionToFractions < ActiveRecord::Migration
  def change
    add_column :fractions, :description, :text
  end
end
