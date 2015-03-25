class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :street
      t.text :data
      t.float :latitude
      t.float  :longitude

      t.timestamps
    end
  end
end
