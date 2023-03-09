require "test_helper"

class WalletControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get wallet_show_url
    assert_response :success
  end
end
