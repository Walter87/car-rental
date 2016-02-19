
$(document).ready(function() {

  $(function () {
    var arr = gon.dates;
    if (typeof arr !== 'undefined' && arr.length > 0) {
    arr = jQuery.map(arr, function(date) {
      return new Date(date*1000);
    });
  } else {
    var errorList = "";
  }
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


