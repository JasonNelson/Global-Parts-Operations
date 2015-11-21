require 'test_helper'

class InventoryItemsControllerTest < ActionController::TestCase
  setup do
    @inventory_item = inventory_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_item" do
    assert_difference('InventoryItem.count') do
      post :create, inventory_item: { barcode: @inventory_item.barcode, description: @inventory_item.description, location_aisle: @inventory_item.location_aisle, location_area: @inventory_item.location_area, product_name: @inventory_item.product_name, qty_on_hand: @inventory_item.qty_on_hand, selling_price: @inventory_item.selling_price, unit_of_measure: @inventory_item.unit_of_measure }
    end

    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should show inventory_item" do
    get :show, id: @inventory_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_item
    assert_response :success
  end

  test "should update inventory_item" do
    patch :update, id: @inventory_item, inventory_item: { barcode: @inventory_item.barcode, description: @inventory_item.description, location_aisle: @inventory_item.location_aisle, location_area: @inventory_item.location_area, product_name: @inventory_item.product_name, qty_on_hand: @inventory_item.qty_on_hand, selling_price: @inventory_item.selling_price, unit_of_measure: @inventory_item.unit_of_measure }
    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should destroy inventory_item" do
    assert_difference('InventoryItem.count', -1) do
      delete :destroy, id: @inventory_item
    end

    assert_redirected_to inventory_items_path
  end
end
