require "test_helper"

class VendorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vendors_index_url
    assert_response :success
  end

  test "should get show" do
    get vendors_show_url
    assert_response :success
  end
end
