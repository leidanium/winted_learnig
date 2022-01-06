require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get seller" do
    get public_seller_url
    assert_response :success
  end
end
