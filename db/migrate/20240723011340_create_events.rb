class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :body
      t.string :status
      t.integer :max_children
      t.integer :number_of_families
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
