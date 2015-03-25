class CreateBulkyWastes < ActiveRecord::Migration
  def change
    create_table :bulky_wastes do |t|
      t.integer :kind
      t.string :street
      t.float :latitude
      t.float :longitude
      t.text :data

      t.timestamps
    end
  end
end
