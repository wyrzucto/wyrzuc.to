class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :ulicas
      t.string :ulica
      t.string :nr_domu
      t.string :dzielnica
      t.string :suche1
      t.string :suche2
      t.string :suche3
      t.string :suche4
      t.string :suche5
      t.string :suche6
      t.string :mokre1
      t.string :mokre2
      t.string :mokre3
      t.string :mokre4
      t.string :mokre5
      t.string :mokre6
      t.string :mieszane1
      t.string :mieszane2
      t.string :mieszane3
      t.string :mieszane4
      t.string :mieszane5
      t.string :mieszane6
      t.string :nie_odebrane
      t.string :typ

      t.timestamps null: false
    end
  end
end
