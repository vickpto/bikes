require 'test_helper'

class ContractHistoriesControllerTest < ActionController::TestCase
  setup do
    @contract_history = contract_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_history" do
    assert_difference('ContractHistory.count') do
      post :create, contract_history: { contractDate: @contract_history.contractDate, finalContractDate: @contract_history.finalContractDate, personId: @contract_history.personId }
    end

    assert_redirected_to contract_history_path(assigns(:contract_history))
  end

  test "should show contract_history" do
    get :show, id: @contract_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_history
    assert_response :success
  end

  test "should update contract_history" do
    patch :update, id: @contract_history, contract_history: { contractDate: @contract_history.contractDate, finalContractDate: @contract_history.finalContractDate, personId: @contract_history.personId }
    assert_redirected_to contract_history_path(assigns(:contract_history))
  end

  test "should destroy contract_history" do
    assert_difference('ContractHistory.count', -1) do
      delete :destroy, id: @contract_history
    end

    assert_redirected_to contract_histories_path
  end
end
