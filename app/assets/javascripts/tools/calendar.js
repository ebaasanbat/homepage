$(document).ready(function() {
    var path = "/tools/attendance/event/user";
    console.log(gon.admin);
    if(gon.admin){
      path = "/tools/attendance/events/";
    }
    else {
    var updateEvent = function(calevent, revertFunc) {
        var url = "/tools/attendance/events/" + calevent.id;
        $.ajax({
            type: "DELETE",
            url: url,
            success: function() {
                calendar.fullCalendar("refetchEvents");
            },
            error: revertFunc
        });
    };

    var dayClick = function(date) {
        var data = {
            "tools_attendance_event": {
                "user_id": gon.user_id,
                "title": "休み",
                "start": date.format("YYYY-MM-DD HH:mm:ss Z"),
                "allDay": true,
		"color": "red",
            }
        };
        $.ajax({
            type: "POST",
            url: "/tools/attendance/events",
            data: data,
            success: function(data) {
                calendar.fullCalendar('refetchEvents');
            }
        });
        calendar.fullCalendar('unselect');
    };
    };
    var calendar = $('#calendar').fullCalendar({
        events: path,
	eventDataTransform: function (rawData){
	    if(gon.admin){
	    	var rawtitle= rawData.user.username;
	    } else {
		var rawtitle= rawData.title;
	    }
	    return {
		id: rawData.id,
		title: rawtitle,
		start: rawData.start,
		color: rawData.color,
		allDay: rawData.allDay,
		user_id: rawData.user_id,
	    };
	},
        ignoreTimezone: false,
        locale: 'ja',
        dayClick: dayClick,
	height: "auto",
        eventClick: updateEvent,
        hiddenDays: [0, 6],
        // theme: true,
    });
});
