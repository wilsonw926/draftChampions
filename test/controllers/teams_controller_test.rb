require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get teams_index,_url
    assert_response :success
  end

  test "should get new" do
    get teams_new_url
    assert_response :success
  end

end
