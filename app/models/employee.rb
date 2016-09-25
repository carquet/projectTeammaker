class Employee < ApplicationRecord
	has_many :bookings , through: :booking_employees
	has_many :booking_employees


	def as_json(options={})
    super(only: [:name],
    	include: :bookings)
  	end

	def add_booking booking
	   self.bookings.push(bookings)
	end

	def self.get_available(date)
				where.not(id: includes(:bookings).references(:bookings)
					.where(bookings: { starting_date: date }).pluck(:employee_id))
	end
end




# user.as_json(:include => { :posts => {
#                              :include => { :comments => {
#                                              :only => :body } },
#                              :only => :title } })
# => { "id": 1, "name": "Konata Izumi", "age": 16,
#      "created_at": "2006/08/01", "awesome": true,
#      "posts": [ { "comments": [ { "body": "1st post!" }, { "body": "Second!" } ],
#                   "title": "Welcome to the weblog" },
#                 { "comments": [ {"body": "Don't think too hard" } ],
#                   "title": "So I was thinking" } ]
#    }