class CreateWastes < ActiveRecord::Migration
  def change
    create_table :wastes do |t|
      t.integer :kind
      t.string  :street
      t.float   :latitude
      t.float   :longitude
      t.text    :data

      t.timestamps
    end
  end
end
