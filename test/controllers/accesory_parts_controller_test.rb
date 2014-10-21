require 'test_helper'

class AccesoryPartsControllerTest < ActionController::TestCase
  setup do
    @accesory_part = accesory_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accesory_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accesory_part" do
    assert_difference('AccesoryPart.count') do
      post :create, accesory_part: { productDescription: @accesory_part.productDescription, productId: @accesory_part.productId, productImage: @accesory_part.productImage, productName: @accesory_part.productName, productPrice: @accesory_part.productPrice, productReference: @accesory_part.productReference, productStatus: @accesory_part.productStatus, productTradeMark: @accesory_part.productTradeMark, typeElement: @accesory_part.typeElement }
    end

    assert_redirected_to accesory_part_path(assigns(:accesory_part))
  end

  test "should show accesory_part" do
    get :show, id: @accesory_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accesory_part
    assert_response :success
  end

  test "should update accesory_part" do
    patch :update, id: @accesory_part, accesory_part: { productDescription: @accesory_part.productDescription, productId: @accesory_part.productId, productImage: @accesory_part.productImage, productName: @accesory_part.productName, productPrice: @accesory_part.productPrice, productReference: @accesory_part.productReference, productStatus: @accesory_part.productStatus, productTradeMark: @accesory_part.productTradeMark, typeElement: @accesory_part.typeElement }
    assert_redirected_to accesory_part_path(assigns(:accesory_part))
  end

  test "should destroy accesory_part" do
    assert_difference('AccesoryPart.count', -1) do
      delete :destroy, id: @accesory_part
    end

    assert_redirected_to accesory_parts_path
  end
end
