class BookingsController < ApplicationController
# 	def new
# 		@booking = Booking.new
# 		render 'new'
# 	end

# 	def create
# 		@booking = Booking.new booking_params
# 		if @booking.save
# 			redirect_to action: 'index'
# 		else
# 			render 'new'
# 		end		
# 	end

# 	def index
# 		@bookings = Booking.all
# 	end

# 	def select_by_day
# 		render 'day'
# 	end
		
# 	def show_by_day
# 			@chosen_date = params[:selected_date]
# 			@available_employees = Employee.get_available(@chosen_date)
# 			@my_bookings = Booking.where("starting_date=?", @chosen_date)
# 			@booking_staff = Hash[@my_bookings.collect{|booking|[booking.id, booking.number_children/12]}]
# 				i = 0
# 				staff_of_the_booking = {}
# 				@booking_staff.each do |key, value|
# 				#binding.pry
# 				n = value
# 				working_on_booking = []
# 				#binding.pry
# 					until working_on_booking.length == n
# 						working_on_booking.push(@available_employees[i])
# 						i += 1
# 					#binding.pry
# 					end
# 				staff_of_the_booking[key]= working_on_booking
# 				#binding.pry
# 			# specific_school_id = my_bookings.map {|booking| booking.school_id}
# 			# @schools = School.where(id:specific_school_id)	
# 			end
			
# 	end
	
# #	def pepe_el_pollo
# #		@booooof = Booking.first
# #		render 'plouf'
# #	end

# private
# 	def booking_params
# 		params.require(:booking).permit(:starting_date, :number_children, :school_id)
# 	end
end

	# def find_number_of_employee(bookings)
	# 	@booking_staff = Hash[bookings.collect{|booking|[booking.id, booking.number_children/12]}]
	# end

