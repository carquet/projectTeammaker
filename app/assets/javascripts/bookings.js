
//answer to the second callasking for employees that work on the specific booking clicked
function showEmployeeBooked(response){
	var bookedEmployees = response;
	bookedEmployees.forEach(function(theEmployee){
		var employeehtml = "<li id=" + theEmployee.id + ">" + theEmployee.name + "<button>Click Me!</button></li>";
	 	$('#js-employees').append(employeehtml);
		 })			
}

//the response is neatly stored in the handlersuccess function. And then each function that deals with different parts is called.
function handleSuccess(response){
	var bookings = response["bookings_by_day"];
	//var employees = response["not_available_employees"];
	var availableEmployees = response["available_employee"];
	showBookingsByDay(bookings);
	//showEmployeeByBooking(employees);
	showAvailableEmployees(availableEmployees);
}

//First click on calendar, triggers all of these actions. 
function showAvailableEmployees(availableEmployees){
	$('#js-available-employee').empty();
	availableEmployees.forEach(function(employee){
		var employeehtml = "<li id="+ employee.id + ">" + employee.name + "<button>Click Me!</button></li>";
		$('#js-available-employee').append(employeehtml);
	})
}


function showBookingsByDay(bookings){
	$('#js-booking_of_the_day').empty();
	bookings.forEach(function(theBooking){
		theBooking.employees.forEach(function(employee){
		//	e += "<li>" + employee.name + "</li>";
		//});
		var html = "<h4 id="+ theBooking.id + ">"  + theBooking.school.name + "</h4><ul><li>" + theBooking.number_children + "</li></ul>";
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
	$('.js-booking').on('click', 'h4', function(){
		var bookingId = $(this).attr('id');
		var request2 = $.ajax({
			type: 'post',
			url: '/api/bookings/booked',
			data: {data: bookingId},
			success: showEmployeeBooked,
			error: handleError
		})
	})
	// $('#js-available-employee').on('click', 'li button',function(event){
	// 		var employeeId = $(this).parents().attr('id');
	// 		var request3 = $.ajax({
	// 			type: 'post',
	// 			url: '/api/bookings/add_employee',
	// 		})
	// 	})
			

})
//WHY HERE WITHIN THE DOCUMENT READY?
// When the DOM is created, some events do not exist yet eg: my employees lists with little buttons.
//I need to tell the document that I am going to do things with stuff that do not exist yet !
//In order to do that, I need to talk to the father of the future element and tell it to get ready to listen.
//this is what we are doing here: we are telling the existing fathers(id available employee..)to listen to any event 
//related to a son (li button) in case it exist!(freaking fathers, never know they have sons or not!)
			//$('#js-available-employee').on('click','li button', function(event){
			// var copyCat = event.currentTarget.parentNode;
			// $('#js-employees').append(copyCat);
			//})

	//SEND EMPLOYEE FROM AVAILABLE LIST TO UNAVAILABLE LIST
	// $('#js-employees').on('click', 'li button',function(event){
	// 		var copyBack = event.currentTarget.parentNode;
	// 		$('#js-available-employee').prepend(copyBack);
	// 		})


	//SEND EMPLOYEE FROM UNAVAILABLE LIST TO AVAILABLE LIST
	// $('#js-confirm-btn').on('click', function(){
	// 	var childrenElement = $("#js-employees li")
	// 	for (var i = 0; i < childrenElement.length; i ++){
	// 				console.log($(childrenElement[i]).attr('id'))
	// 	} //var c = document.getElementById("js-employees").children;
	
	// })
//
	