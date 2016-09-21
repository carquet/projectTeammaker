class Employee < ApplicationRecord
	has_many :bookings , through: :booking_employees
	has_many :booking_employees
end
