require 'test_helper'

class CustomerAccountsControllerTest < ActionController::TestCase
  setup do
    @customer_account = customer_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_account" do
    assert_difference('CustomerAccount.count') do
      post :create, customer_account: { cell_phone: @customer_account.cell_phone, city: @customer_account.city, email: @customer_account.email, fname: @customer_account.fname, home_phone: @customer_account.home_phone, lname: @customer_account.lname, middle_initial: @customer_account.middle_initial, password: @customer_account.password, phone_pref: @customer_account.phone_pref, state: @customer_account.state, street_add: @customer_account.street_add, zipcode: @customer_account.zipcode }
    end

    assert_redirected_to customer_account_path(assigns(:customer_account))
  end

  test "should show customer_account" do
    get :show, id: @customer_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_account
    assert_response :success
  end

  test "should update customer_account" do
    patch :update, id: @customer_account, customer_account: { cell_phone: @customer_account.cell_phone, city: @customer_account.city, email: @customer_account.email, fname: @customer_account.fname, home_phone: @customer_account.home_phone, lname: @customer_account.lname, middle_initial: @customer_account.middle_initial, password: @customer_account.password, phone_pref: @customer_account.phone_pref, state: @customer_account.state, street_add: @customer_account.street_add, zipcode: @customer_account.zipcode }
    assert_redirected_to customer_account_path(assigns(:customer_account))
  end

  test "should destroy customer_account" do
    assert_difference('CustomerAccount.count', -1) do
      delete :destroy, id: @customer_account
    end

    assert_redirected_to customer_accounts_path
  end
end
