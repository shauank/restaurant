# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#pay_to_confirm").click (e) =>
    $.get("/details/"+$("#detail_id").val()+"/reservations/"+$("#reservation_id").val()+"/confirm?coupon_code="+$("#selected_card").val()).done((data, xhr, response) =>
      alert(data);
    ).fail((data, xhr, response) =>
      alert('failed')
    )
  
  
        