
$(document).ready(function() {

  $(function () {
    var arr = gon.dates;
    arr = jQuery.map(arr, function(date) {
      return new Date(date*1000);
    });
    $('#datetimepicker12').datetimepicker({

      format: "dd MM yyyy",
      inline: true,
      disabledDates: arr,
      showTodayButton: true,
    });

  });
});


