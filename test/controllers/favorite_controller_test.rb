require 'test_helper'

class FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get fav" do
    get favorite_fav_url
    assert_response :success
  end

end
