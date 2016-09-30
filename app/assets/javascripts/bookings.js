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
	$('#js-booking_of_the_day').on('click', 'h4', function(){
		var bookingId = $(this).attr('id');
		var request2 = $.ajax({
			type: 'post',
			url: '/api/bookings/booked',
			data: {data: bookingId},
			success: showEmployeeBooked,
			error: handleError
		})
		
	})

	$('#js-available-employee').on('click','li button', function(event){
			 var copyCat = event.currentTarget.parentNode;
			 $('#js-employees').append(copyCat);
	})
	$('#js-confirm-btn').on('click', function(){
		var childrenElement = $("#js-employees li")
		var currentEmployeeId = []
		var bookingId = $('.js-confirm-box').attr("id")
		for (var i = 0; i < childrenElement.length; i ++){
				 currentEmployeeId.push($(childrenElement[i]).attr('id'))
		} 
		var bookingEmployee = {
				employeesId: currentEmployeeId,
				currentBookingId: bookingId
		}

		var request3 = $.ajax({
			type: 'post',
			url: '/api/bookings/add',
			data: {data: bookingEmployee},
			success: addEmployeeInBookings,
			error: handleError
		})
	})
	
})

function addEmployeeInBookings(response){
	var confirmed = response;
	alert(response.success);
	$('#js-employees').hide()
}

//answer to the second callasking for employees that work on the specific booking clicked
function showEmployeeBooked(response){
	var bookedEmployees = response["booked_employees"];
	var booking = response["booking"];
	$('.js-confirm-box').attr("id", booking.id)
	$('#js-employees').empty()
	bookedEmployees.forEach(function(theEmployee){
		var employeehtml = "<li id=" + theEmployee.id + ">" + theEmployee.name + "</li>";
	 	$('#js-employees').append(employeehtml);
		 })			
}

//the response is neatly stored in the handlersuccess function. And then each function that deals with different parts is called.
function handleSuccess(response){
	var bookings = response["bookings_by_day"];
	var availableEmployees = response["available_employee"];
	showBookingsByDay(bookings);
	showAvailableEmployees(availableEmployees);
}

//First click on calendar, triggers all of these actions. 
function showAvailableEmployees(availableEmployees){
	$('#js-available-employee').empty();
	availableEmployees.forEach(function(employee){
		var employeehtml = "<li id="+ employee.id + ">" + employee.name + "<button class='clickme'>add me</button></li>";
		$('#js-available-employee').append(employeehtml);
	})
}

//Puts all the booking in a table
function showBookingsByDay(bookings){
	$('#js-booking_of_the_day').empty();
	bookings.forEach(function(theBooking){
		var html = "<h4 class='bookings' id="+ theBooking.id + ">"  + theBooking.school.name + "</h4>";
		var html2= "<ul><li>Number of attendees: " + theBooking.number_children + "</li></ul>";
		$('#js-booking_of_the_day').append(html);
		$('#js-number_of_children').append(html2);
	})

	
}

function handleError(err){	
}



    
	

//WHY HERE WITHIN THE DOCUMENT READY?
// When the DOM is created, some events do not exist yet eg: my employees lists with little buttons.
//I need to tell the document that I am going to do things with stuff that do not exist yet !
//In order to do that, I need to talk to the father of the future element and tell it to get ready to listen.
//this is what we are doing here: we are telling the existing fathers(id available employee..)to listen to any event 
//related to a son (li button) in case it exist!(freaking fathers, never know they have sons or not!)
			
 