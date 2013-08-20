$(document).ready(function() {
  $(".hello__greeting").fitText(.4);

  $(".hello__name").fitText(.4);

  $(".data__group--sleeping").data('sleeping') == true ? $(".page").addClass("page--sleeping") : $(".page").removeClass("page--sleeping"); 

});

function updateGroups() {
  $.get('/weights/1', function(data) {
    $('.data__group').val(data);
  });
}
