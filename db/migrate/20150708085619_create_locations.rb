class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :number
      t.string :full_address
      t.float :lat
      t.float :lng
      t.integer :number_int

      t.timestamps
    end
  end
end
