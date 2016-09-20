class SchoolsController < ApplicationController
	def new
		@school = School.new
		render 'new'
	end

	def create
		@school = School.new school_params
		if @school.save
			redirect_to action: 'index'
		else
			render 'new'
		end

	end

	def index
		@schools = School.all
	end

	private
	def school_params
		params.require(:school).permit(:name)
	end
end
