class AddDistrictToWastes < ActiveRecord::Migration
  def change
    add_reference :wastes, :district, index: true
  end
end
