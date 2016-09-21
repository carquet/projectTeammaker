class BookingEmployee < ApplicationRecord
  belongs_to :booking
  belongs_to :employee
end
