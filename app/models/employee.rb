class Employee < ApplicationRecord
	has_many :bookings , through: :booking_employees
	has_many :booking_employees

	def self.get_available(date)
				where.not(id: includes(:bookings).references(:bookings)
					.where(bookings: { starting_date: date }).pluck(:employee_id))
	end
end
