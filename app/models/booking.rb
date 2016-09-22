class Booking < ApplicationRecord
  belongs_to :school
  has_many :employees, through: :booking_employees
  has_many :booking_employees

  
end
