require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when logged in" do
    get user_path
    assert_redirected_to login_url
  end

  # test "should redirect update when no logged in" do
  #   patch user_path(@user), params:
  #     {
  #       user: {
  #         name: @user.name,
  #         email: @user.email
  #       }
  #     }
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end

  test "should redirect destroy when not logged in" do
   assert_no_difference 'User.count' do
     delete user_path(@user)
   end
   assert_redirected_to login_url
 end


  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
end
