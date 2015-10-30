class AddPictureToWastes < ActiveRecord::Migration
  def change
    add_column :wastes, :picture, :string
  end
end
