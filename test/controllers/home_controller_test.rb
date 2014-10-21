require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get salud" do
    get :salud
    assert_response :success
  end

end
