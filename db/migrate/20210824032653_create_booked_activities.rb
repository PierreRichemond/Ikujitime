class CreateBookedActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :booked_activities do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :child, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
