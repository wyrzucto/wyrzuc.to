require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get s1" do
    get :s1
    assert_response :success
  end

  test "should get s2" do
    get :s2
    assert_response :success
  end

end
