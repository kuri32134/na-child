class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :status
      t.integer :max_children
      t.integer :number_of_families
      t.datetime :start
      t.datetime :end
      t.integer :leader_id

      t.timestamps
    end
  end
end
