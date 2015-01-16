class CreateBins < ActiveRecord::Migration
  def change
    create_table :bins do |t|
      t.string :ul
      t.string :ulica
      t.string :dzielnica
      t.string :numer
      t.string :suche
      t.string :mokre
      t.string :zmieszane
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
