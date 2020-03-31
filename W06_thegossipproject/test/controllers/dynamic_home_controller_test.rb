require 'test_helper'

class DynamicHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dynamic_home_show_url
    assert_response :success
  end

end
