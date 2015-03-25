class CreateWetAndDryWastes < ActiveRecord::Migration
  def change
    create_table :wet_and_dry_wastes do |t|
      t.integer :kind
      t.string :street
      t.float :latitude
      t.float :longitude
      t.text :data

      t.timestamps
    end
  end
end
