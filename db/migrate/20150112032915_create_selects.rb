class CreateSelects < ActiveRecord::Migration
  def change
    create_table :selects do |t|
      t.string :ulica
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
