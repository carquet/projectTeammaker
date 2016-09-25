# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
schools = School.create([
	{name: 'Colegio Gaudem'},
	{name: 'colegio Rubio'}
	])

employees = Employee.create([
	{name: 'Tonio'},
	{name: 'Ana'},
	{name: 'Alberto'},
	{name: 'Eva'},
	{name: 'Jessica'},
	{name: 'Alex'},
	{name: 'Diego'},
	{name: 'Chris'},
	{name: 'Rafa'},
	{name: 'Mariola'},
	{name: 'Eminio'}
	])

bookings = Booking.create([
	{starting_date: '19.09.2016'.to_date, number_children: 30 , school_id: 1},
	{starting_date: '20.09.2016'.to_date, number_children: 45, school_id: 2},
	{starting_date: '20.09.2016'.to_date, number_children: 50, school_id: 1}
	])