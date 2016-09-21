class CreateBookingEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_employees do |t|
      t.references :booking, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
