class Api::BookingsController < ApplicationController
	
	def show_by_day
		bookings = Booking.where(starting_date: params[:date])
		#Booking.where(starting_date: params[:date]).joins(:employees).pluck(:name)
		available_employee = []
			Employee.all.each do |employee| 
				has_booking = employee.bookings.where(starting_date: params[:date])
					if has_booking.empty?
						available_employee << employee
					end
			end	
		render json: {
			bookings_by_day: bookings,
			available_employee: available_employee 
		}
	end
	
	def booked
		booking = Booking.find(params[:data])
		booked_employees = booking.employees
		render json:  {booked_employees: booked_employees,
					booking: booking}
	end


	def add_employee
		booking = Booking.find_by(id: params[:data][:currentBookingId])
		
			unless booking
				render json: {error: "there is no booking at this date"}, status: 404
				return
			end

		employees_to_hire = Employee.where(id: params[:data][:employeesId])
		newly_employed = []

			employees_to_hire.each do |employee|
				if booking.employees.find_by(id: employee) == nil
					booking.employees.push(employee)
				end
			end
		render json: {success: "Your staff is confirmed"}, status: 201
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

	

	private
	def booking_params
		params.require(:booking).permit(:starting_date, :number_children, :school_id)
	end
end