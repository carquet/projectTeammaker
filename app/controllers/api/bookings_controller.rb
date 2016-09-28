class Api::BookingsController < ApplicationController
	
	def show_by_day
		bookings = Booking.where(starting_date: params[:date])
		not_available_employees = Booking.where(starting_date: params[:date]).joins(:employees).pluck(:name)
		available_employee = []
			Employee.all.each do |employee| 
				has_booking = employee.bookings.where(starting_date: params[:date])
					if has_booking.empty?
						available_employee << employee
					end
			end	
		render json: {
			bookings_by_day: bookings,
			not_available_employees: not_available_employees,
			available_employee: available_employee 
		}
	end
	
	def index
		bookings = Booking.all
		render json: bookings
	end

	def new
		@booking = Booking.new
		render 'bookings/new'
	end


	def create
		@booking = Booking.create(booking_params)
		render json: @booking
	end


	def show
		@booking = Booking.find_by(id: params[:id])
		unless @booking
			render json: {error: "there is no booking at this date"}, status: 404
			return
		end
		render json: @booking
	end

	

	def update
		booking = Booking.find_by(id: params[:id])
		unless booking
			render json: {error: "there is no booking at this date"}, status: 404
			return
		end
		booking.update(booking_params)
		render json: booking
	end

	def destroy
		booking = Booking.find_by(id: params[:id])
		unless booking
			render json: {error: "there is no booking at this date"}, status: 404
			return
		end
		booking.destroy
		render json: booking
	end

	def add_employee
		booking = Booking.find_by(id: params[:booking_id])
		unless booking
			render json: {error: "there is no booking at this date"}, status: 404
			return
		end

		employee = Employee.find_by(id: params[:employee_id])
		unless employee
			render json: {error: "there is no employee"}, status: 404
			return
		end
		booking.add_employee(employee)
		render json: booking
	end

	private
	def booking_params
		params.require(:booking).permit(:starting_date, :number_children, :school_id)
	end
end