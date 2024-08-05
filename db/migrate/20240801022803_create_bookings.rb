class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :number_of_children, null: false
      t.integer :number_of_guardians, null: false
      t.text :remarks
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end