class CreateHazardousWastes < ActiveRecord::Migration
  def change
    create_table :hazardous_wastes do |t|
      t.string :street
      t.float :latitude
      t.float :longitude
      t.text :data

      t.timestamps
    end
  end
end
