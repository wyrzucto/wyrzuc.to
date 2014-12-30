class CreateKolorowes < ActiveRecord::Migration
  def change
    create_table :kolorowes do |t|
      t.string :ulica
      t.string :numer
      t.string :opis
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
