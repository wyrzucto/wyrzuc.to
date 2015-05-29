class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :name
      t.integer :fraction_id

      t.timestamps
    end
  end
end
