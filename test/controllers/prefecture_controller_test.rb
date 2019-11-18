require 'test_helper'

class PrefectureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prefecture_index_url
    assert_response :success
  end

  test "should get select" do
    get prefecture_select_url
    assert_response :success
  end

end
