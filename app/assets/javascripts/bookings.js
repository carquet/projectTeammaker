function handleSuccess(response){
	var bookings = response["bookings_by_day"];
	var employees = response["not_available_employees"];
	var availableEmployees = response["available_employee"];
	showBookingsByDay(bookings);
	showEmployeeByBooking(employees);
	showAvailableEmployees(availableEmployees);
}


function showAvailableEmployees(availableEmployees){
	$('#js-available-employee').empty();
	availableEmployees.forEach(function(employee){
		var employeehtml = "<li id="+ employee.id + ">" + employee.name + "<button>Click Me!</button></li>";
		$('#js-available-employee').append(employeehtml);
	})
	$('li button').on('click', function(event){
			var copyCat = event.currentTarget.parentNode;
			$('#js-employees').append(copyCat);
			//var x = document.getElementById().parentElement;
			//console.log($(this).parent());
			
		})
}

function showEmployeeByBooking(employees){
	$('#js-employees').empty();
	employees.forEach(function(employee){
		var employeehtml = "<li>" + employee + "</li>";
		$('#js-employees').append(employeehtml);
	})

}

function showBookingsByDay(bookings){
	$('#js-booking_of_the_day').empty();
	bookings.forEach(function(theBooking){
		theBooking.employees.forEach(function(employee){
		//	e += "<li>" + employee.name + "</li>";
		//});
		var html = "<h4>"  + theBooking.school.name + "</h4><ul><li>" + theBooking.number_children + "</li></ul>";
		//e = "";
		$('#js-booking_of_the_day').append(html)
		})	
	})
}



function handleError(err){	
}




$(document).on('ready', function(){
	$('.date').on('click', function(event){
		event.preventDefault()
		var dateChosen =$(this).text();
		var request = $.ajax({
			type: 'post',
			url: '/api/bookings/show_by_day',
			data: {date: dateChosen },
			success: handleSuccess,
			error: handleError
		})	
	})	
	
})
	