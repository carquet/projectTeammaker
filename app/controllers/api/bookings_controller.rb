class Api::BookingsController < ApplicationController
	def index
		bookings = Booking.all
		render json: bookings
	end

	def create
		booking = Booking.create(sandwich_params)
		render json: booking
	end

	def show
		booking = Booking.find_by(id: params[:id])
		unless booking
			render json: {error: "there is no booking at this date"}, status: 404
			return
		end
		render json: booking
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