class CreatePurchasedGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :purchased_gifts do |t|
      t.date :date
      t.string :ocassion
      t.references :gift, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
