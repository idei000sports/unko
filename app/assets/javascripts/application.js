// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery.turbolinks  
//= require activestorage
//= require jquery
//= require moment
//= require fullcalendar
//= require_tree .

$(function () {
    function eventCalendar() {
        return $('#calendar').fullCalendar({});
    };
    function clearCalendar() {
        $('#calendar').html('');
    };
    $(document).on('turbolinks:load', function () {
    eventCalendar();
    });
    $(document).on('turbolinks:before-cache', clearCalendar);

    $('#calendar').fullCalendar({
	events: '/events.json',
	titleFormat: 'YYYY年 M月',
	dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
	timeFormat: "HH:mm",
	selectable: true,
	selectHelper: true,

	dayClick: function(date, jsEvent, view) {
		window.location.href = '/today/select?date=' + date.format();
	}

    });
});

