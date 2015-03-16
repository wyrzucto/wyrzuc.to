class AddNameAndSurnameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :surname, :string
  end
end
