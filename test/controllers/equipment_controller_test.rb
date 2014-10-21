require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { gender: @equipment.gender, productDescription: @equipment.productDescription, productId: @equipment.productId, productImage: @equipment.productImage, productName: @equipment.productName, productPrice: @equipment.productPrice, productReference: @equipment.productReference, productStatus: @equipment.productStatus, productTradeMark: @equipment.productTradeMark, size: @equipment.size }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    patch :update, id: @equipment, equipment: { gender: @equipment.gender, productDescription: @equipment.productDescription, productId: @equipment.productId, productImage: @equipment.productImage, productName: @equipment.productName, productPrice: @equipment.productPrice, productReference: @equipment.productReference, productStatus: @equipment.productStatus, productTradeMark: @equipment.productTradeMark, size: @equipment.size }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
