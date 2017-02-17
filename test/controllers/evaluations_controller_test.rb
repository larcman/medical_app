require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get evaluations_edit_url
    assert_response :success
  end

end
