require 'test_helper'

class EvenpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evenp = evenps(:one)
  end

  test "should get index" do
    get evenps_url
    assert_response :success
  end

  test "should get new" do
    get new_evenp_url
    assert_response :success
  end

  test "should create evenp" do
    assert_difference('Evenp.count') do
      post evenps_url, params: { evenp: { description: @evenp.description, end_date: @evenp.end_date, start_date: @evenp.start_date, title: @evenp.title } }
    end

    assert_redirected_to evenp_url(Evenp.last)
  end

  test "should show evenp" do
    get evenp_url(@evenp)
    assert_response :success
  end

  test "should get edit" do
    get edit_evenp_url(@evenp)
    assert_response :success
  end

  test "should update evenp" do
    patch evenp_url(@evenp), params: { evenp: { description: @evenp.description, end_date: @evenp.end_date, start_date: @evenp.start_date, title: @evenp.title } }
    assert_redirected_to evenp_url(@evenp)
  end

  test "should destroy evenp" do
    assert_difference('Evenp.count', -1) do
      delete evenp_url(@evenp)
    end

    assert_redirected_to evenps_url
  end
end
