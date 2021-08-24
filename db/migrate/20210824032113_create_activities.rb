class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :price
      t.string :description
      t.string :website_link

      t.timestamps
    end
  end
end
