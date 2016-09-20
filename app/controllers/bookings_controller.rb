class BookingsController < ApplicationController
	def new
		@booking = Booking.new
		render 'new'
	end

	def create
		@booking = Booking.new booking_params
		if @booking.save
			redirect_to action: 'index'
		else
			render 'new'
		end		
	end

	def index
		@bookings = Booking.all
	end


	private
	def booking_params
		params.require(:booking).permit(:starting_date, :number_children, :school_id)
	end
end
