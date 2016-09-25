class Api::EmployeesController < ApplicationController
	

	def index
		employees = Employee.all
		render json: employees
	end


	def create
	  employee = Employee.create(employee_params)
	  render json: employee
	end


	def show
	  employee = Employee.find_by(id: params[:id])
	  unless employee
	    render json: {error: "employee not found"},
	    status: 404
	    return
	  end
	  render json: employee
	end


	def update
	  employee = Employee.find_by(id: params[:id])
	  unless employee
	    render json: {error: "employee not found"},
	    status: 404
	    return
	  end
	  employee.update(employee_params)
	  render json: employee
	end


	def destroy
	  employee = Employee.find_by(id: params[:id])
	  unless employee
	    render json: {error: "employee not found"},
	    status: 404
	    return
	  end
	  employee.destroy
	  render json: employee
	end


	def add_booking booking 
		employee = Employee.find_by(id: params[:employee_id])
	  	unless employee
		    render json: {error: "employee not found"},
		    status: 404
	    	return
	  	end

	  	booking = Booking.find_by(id: params[:booking_id])
		unless booking
			render json: {error: "there is no booking at this date"}, status: 404
			return
		end
		employee.add_booking(booking)
		render json: employee
	end


	

	private

	def employee_params
	  params.require(:employee)
	    .permit(:name)
	end
end