class CreatePunkts < ActiveRecord::Migration
  def change
    create_table :punkts do |t|
      t.string :nazwa
      t.integer :telefon
      t.string :co
      t.float :c1
      t.float :c2

      t.timestamps null: false
    end
  end
end
