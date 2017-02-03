require 'test_helper'

class AssignsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get assigns_new_url
    assert_response :success
  end

end
