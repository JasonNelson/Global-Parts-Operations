require 'test_helper'

class SoPickListsControllerTest < ActionController::TestCase
  setup do
    @so_pick_list = so_pick_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:so_pick_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create so_pick_list" do
    assert_difference('SoPickList.count') do
      post :create, so_pick_list: { order_line_id: @so_pick_list.order_line_id, sales_order_id: @so_pick_list.sales_order_id }
    end

    assert_redirected_to so_pick_list_path(assigns(:so_pick_list))
  end

  test "should show so_pick_list" do
    get :show, id: @so_pick_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @so_pick_list
    assert_response :success
  end

  test "should update so_pick_list" do
    patch :update, id: @so_pick_list, so_pick_list: { order_line_id: @so_pick_list.order_line_id, sales_order_id: @so_pick_list.sales_order_id }
    assert_redirected_to so_pick_list_path(assigns(:so_pick_list))
  end

  test "should destroy so_pick_list" do
    assert_difference('SoPickList.count', -1) do
      delete :destroy, id: @so_pick_list
    end

    assert_redirected_to so_pick_lists_path
  end
end
