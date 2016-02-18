
$(document).ready(function() {

  $(function () {
    var arr = gon.dates;
    arr = jQuery.map(arr, function(date) {
      return new Date(date*1000);
    });
    $('#datetimepicker12').datetimepicker({
      disabledDates: arr,
      format: "dd MM yyyy",
      inline: true,
      showTodayButton: true,
      });
    $('#refresh_button').click(function(){
      location.reload(true);
    });
  });
});


