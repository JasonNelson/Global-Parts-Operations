# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
jQuery -> 
  $('#submitBtn').click (evt) ->
    $("#fname").html $('#customer_account_fname').val()
    $("#middle_initial").html $('#customer_account_middle_initial').val()
    $("#lname").html $('#customer_account_lname').val()
    $("#street_add").html $('#customer_account_street_add').val()
    $("#city").html $('#customer_account_city').val()
    $("#state").html $('#customer_account_state').val()
    $("#zipcode").html $('#customer_account_zipcode').val()
    $("#email").html $('#customer_account_email').val()
    $("#home_phone").html $('#customer_account_home_phone').val()
    $("#cell_phone").html $('#customer_account_cell_phone').val()
    $("#phone_pref").html $('#customer_account_phone_pref').val()

$(document).ready(ready)
$(document).on('page:load', ready)
