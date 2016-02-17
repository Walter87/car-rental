// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require moment
//= require bootstrap-datetimepicker
// $(document).ready(function() {
//   alert $('#products').data('products')

// });
$(document).ready(function() {
  var arr = gon.dates;
  arr = jQuery.map(arr, function(date) {
    return new Date(date*1000);
  });
  $(function () {
        $('#datetimepicker12').datetimepicker({

            format: "dd MM yyyy",
            inline: true,
            disabledDates: arr,
            showTodayButton: true,
        });

    });
});
