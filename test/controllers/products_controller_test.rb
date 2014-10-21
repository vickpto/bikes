require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { bikeType: @product.bikeType, gender: @product.gender, measures: @product.measures, productDescription: @product.productDescription, productId: @product.productId, productName: @product.productName, productPrice: @product.productPrice, productReference: @product.productReference, productStatus: @product.productStatus, productTradeMark: @product.productTradeMark, size: @product.size, typeProduct: @product.typeProduct }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { bikeType: @product.bikeType, gender: @product.gender, measures: @product.measures, productDescription: @product.productDescription, productId: @product.productId, productName: @product.productName, productPrice: @product.productPrice, productReference: @product.productReference, productStatus: @product.productStatus, productTradeMark: @product.productTradeMark, size: @product.size, typeProduct: @product.typeProduct }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
