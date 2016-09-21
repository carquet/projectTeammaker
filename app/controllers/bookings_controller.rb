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

	def select_by_day
		render 'day'
	end
		
	def show_by_day
			my_bookings = Booking.where("starting_date=?", params[:selected_date])
			specific_school_id = my_bookings.map {|booking| booking.school_id}
			@schools = School.where(id:specific_school_id)
	end

	
#	def pepe_el_pollo
#		@booooof = Booking.first
#		render 'plouf'
#	end

	private
	def booking_params
		params.require(:booking).permit(:starting_date, :number_children, :school_id)
	end
end
