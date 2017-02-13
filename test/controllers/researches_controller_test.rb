require 'test_helper'

class ResearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get researches_index_url
    assert_response :success
  end

  test "should get show" do
    get researches_show_url
    assert_response :success
  end

  test "should get edit" do
    get researches_edit_url
    assert_response :success
  end

end
