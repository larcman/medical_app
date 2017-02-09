require 'test_helper'

class CentersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get centers_index_url
    assert_response :success
  end

  test "should get show" do
    get centers_show_url
    assert_response :success
  end

end
