class CreateLog < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :info
      t.string :user

      t.timestamps
    end
  end
end
