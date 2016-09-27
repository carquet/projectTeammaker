function handleSuccess(response){
	var bookings = response, e = "";
	bookings.forEach(function(theBooking){
		theBooking.employees.forEach(function(employee){
			e += "<li>" + employee.name + "</li>";
		});
		var html = "<h4>"  + theBooking.school.name + "</h4><ul><li>" + theBooking.number_children + "</li>"+ e + "</ul>";
		e = "";
		$('#js-booking_of_the_day').append(html)
	})	
}

// function showEmployeeAvail(response){
// 	console.log(response)
// }

function handleError(){
	console.log('there was an error');
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
		// var request2 = $.ajax({
		// 	type: 'post',
		// 	url: '/api/booking/show_not_employee',
		// 	data: {date: dateChosen },
		// 	success: showEmployeeAvail,
		// 	error: handleError
		// })
		
	});	
});
	