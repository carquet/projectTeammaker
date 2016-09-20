class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :starting_date
      t.integer :number_children
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
