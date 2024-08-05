class CreateBookingChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_children do |t|
      
      t.string :name_of_child, null: false
      t.integer :age_of_child, null: false
      t.integer :booking_id

      t.timestamps
    end
  end
end
