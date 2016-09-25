class Booking < ApplicationRecord
  belongs_to :school
  has_many :employees, through: :booking_employees
  has_many :booking_employees


  def as_json(options={})
    super(only: [:school_id,:number_children,:starting_date],
      include: [employees: {only: :name}])
  end

  def add_employee employee
    self.employees.push(employee)
  end


  RULES = 12

  def number_of_pipas
  	self.number_children / 12
  end
  # def self.needed_employees(date)
  # 		.where("starting_date=?",date).map
  	
  # end

 #  def get_available
	# Employee.where.not(id: includes(:bookings).references(:bookings)
	# 			.where(bookings: { starting_date: self.starting_date }).pluck(:employee_id))
 #  end
end
