require 'test_helper'

class ContenuControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get contenu_show_url
    assert_response :success
  end

end
