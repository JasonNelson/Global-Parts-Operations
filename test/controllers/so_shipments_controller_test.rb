require 'test_helper'

class SoShipmentsControllerTest < ActionController::TestCase
  setup do
    @so_shipment = so_shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:so_shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create so_shipment" do
    assert_difference('SoShipment.count') do
      post :create, so_shipment: { carrier: @so_shipment.carrier, customer_account_id: @so_shipment.customer_account_id, expected_delivery_date: @so_shipment.expected_delivery_date, method: @so_shipment.method, sales_order_id: @so_shipment.sales_order_id, ship_date: @so_shipment.ship_date, ship_time: @so_shipment.ship_time, shipped_by: @so_shipment.shipped_by, tracking_num: @so_shipment.tracking_num }
    end

    assert_redirected_to so_shipment_path(assigns(:so_shipment))
  end

  test "should show so_shipment" do
    get :show, id: @so_shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @so_shipment
    assert_response :success
  end

  test "should update so_shipment" do
    patch :update, id: @so_shipment, so_shipment: { carrier: @so_shipment.carrier, customer_account_id: @so_shipment.customer_account_id, expected_delivery_date: @so_shipment.expected_delivery_date, method: @so_shipment.method, sales_order_id: @so_shipment.sales_order_id, ship_date: @so_shipment.ship_date, ship_time: @so_shipment.ship_time, shipped_by: @so_shipment.shipped_by, tracking_num: @so_shipment.tracking_num }
    assert_redirected_to so_shipment_path(assigns(:so_shipment))
  end

  test "should destroy so_shipment" do
    assert_difference('SoShipment.count', -1) do
      delete :destroy, id: @so_shipment
    end

    assert_redirected_to so_shipments_path
  end
end
