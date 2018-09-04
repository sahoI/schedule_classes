require 'test_helper'

class WethreappControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wethreapp_index_url
    assert_response :success
  end

end
