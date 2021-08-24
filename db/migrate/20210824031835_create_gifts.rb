class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :price
      t.string :description
      t.string :gender
      t.string :website_link
      t.integer :start_age
      t.integer :end_age

      t.timestamps
    end
  end
end
