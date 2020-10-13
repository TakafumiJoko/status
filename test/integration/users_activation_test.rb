require 'test_helper'

class UsersActivationTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:takafumi)
    @non_activated = users(:non_activated)
  end
  
  test "index only activated user" do
    log_in_as(@user)
    get users_path
    assert_select 'a[href=?]', user_path(@user)
    assert_select 'a[href=?]', user_path(@non_activated), count: 0
  end
  
  test "show only activated user" do
    log_in_as(@user)
    get user_path(@user)
    get user_path(@non_activated)
    assert_redirected_to root_url
  end
end
