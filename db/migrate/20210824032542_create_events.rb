class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :occasion
      t.references :gift, foreign_key: true
      t.references :activity, foreign_key: true
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
