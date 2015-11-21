require 'test_helper'

class SalesOrdersControllerTest < ActionController::TestCase
  setup do
    @sales_order = sales_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_order" do
    assert_difference('SalesOrder.count') do
      post :create, sales_order: { billing_city: @sales_order.billing_city, billing_state: @sales_order.billing_state, billing_street_add: @sales_order.billing_street_add, billing_zipcode: @sales_order.billing_zipcode, cc_exp_month: @sales_order.cc_exp_month, cc_exp_year: @sales_order.cc_exp_year, cc_fname: @sales_order.cc_fname, cc_lname: @sales_order.cc_lname, cc_middle_initial: @sales_order.cc_middle_initial, cc_number: @sales_order.cc_number, cc_security_code: @sales_order.cc_security_code, customer_account_id: @sales_order.customer_account_id, order_status_id: @sales_order.order_status_id, shipping_city: @sales_order.shipping_city, shipping_fee: @sales_order.shipping_fee, shipping_state: @sales_order.shipping_state, shipping_street_address: @sales_order.shipping_street_address, shipping_zipcode: @sales_order.shipping_zipcode, subtotal: @sales_order.subtotal, tax_percent: @sales_order.tax_percent, total: @sales_order.total }
    end

    assert_redirected_to sales_order_path(assigns(:sales_order))
  end

  test "should show sales_order" do
    get :show, id: @sales_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_order
    assert_response :success
  end

  test "should update sales_order" do
    patch :update, id: @sales_order, sales_order: { billing_city: @sales_order.billing_city, billing_state: @sales_order.billing_state, billing_street_add: @sales_order.billing_street_add, billing_zipcode: @sales_order.billing_zipcode, cc_exp_month: @sales_order.cc_exp_month, cc_exp_year: @sales_order.cc_exp_year, cc_fname: @sales_order.cc_fname, cc_lname: @sales_order.cc_lname, cc_middle_initial: @sales_order.cc_middle_initial, cc_number: @sales_order.cc_number, cc_security_code: @sales_order.cc_security_code, customer_account_id: @sales_order.customer_account_id, order_status_id: @sales_order.order_status_id, shipping_city: @sales_order.shipping_city, shipping_fee: @sales_order.shipping_fee, shipping_state: @sales_order.shipping_state, shipping_street_address: @sales_order.shipping_street_address, shipping_zipcode: @sales_order.shipping_zipcode, subtotal: @sales_order.subtotal, tax_percent: @sales_order.tax_percent, total: @sales_order.total }
    assert_redirected_to sales_order_path(assigns(:sales_order))
  end

  test "should destroy sales_order" do
    assert_difference('SalesOrder.count', -1) do
      delete :destroy, id: @sales_order
    end

    assert_redirected_to sales_orders_path
  end
end
