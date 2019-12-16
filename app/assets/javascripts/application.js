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
//= require turbolinks
//= require activestorage
//= require jquery
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-ja

//= require moment
//= require lightbox
//= require_tree .
// Bootstrap
//= require bootstrap-sprockets
//= require popper
//= require serviceworker-companion



$(function() {
    $('#calendar').datepicker({
		showOtherMonths: true,
		dateFormat:'yy-mm-dd',
		dayNamesMin:['日', '月', '火', '水', '木', '金', '土'],
		onSelect: function(dateText, inst) {
			window.location.href = '/select?start_date=' + dateText;
		}

    });
});





