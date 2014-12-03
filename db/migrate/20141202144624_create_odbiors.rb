class CreateOdbiors < ActiveRecord::Migration
  def change
    create_table :odbiors do |t|
      t.string :ulica
      t.date :data

      t.timestamps null: false
    end
  end
end
