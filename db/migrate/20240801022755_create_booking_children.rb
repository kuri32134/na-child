class CreateBookingChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_children do |t|
      
      t.string :name_of_child
      t.string :age_of_child

      t.timestamps
    end
  end
end
