# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
jQuery -> 
  $('#submitBtn').click (evt) ->
    $("#sales_order_id").html $('#so_shipment_sales_order_id').val()
    $("#carrier").html $('#so_shipment_carrier').val()
    $("#method").html $('#so_shipment_method').val()
    $("#tracking_num").html $('#so_shipment_tracking_num').val()
    $("#shipped_by").html $('#so_shipment_shipped_by').val()
$(document).ready(ready)
$(document).on('page:load', ready)
