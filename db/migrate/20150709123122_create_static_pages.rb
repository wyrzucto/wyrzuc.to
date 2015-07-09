class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title
      t.string :slug
      t.text :content

      t.timestamps
    end
  end
end
