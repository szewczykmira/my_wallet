require 'test_helper'

class MyWalletControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'my_wallet/index'
  end

end
