require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: "",
                              email: "user@invalid",
                              password: "foo",
                              password_confirmation: "bar"}
    end
    assert_template 'users/new'
    assert_select 'div.alert-danger'
    assert_select 'div.field_with_errors'
    assert_not flash[:success]
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "Example User",
          email: "user@example.com", password: "password",
          password_confirmation: "password"}
    end
    assert_template 'users/show'
    assert flash[:success]
    assert is_logged_in?
  end

  test "should redirect to profile when had account" do
    get signup_path
    assert_template 'users/new'
    assert_not flash.nil?
    log_in_as(@user)
    get signup_path
    assert_redirected_to user_path(@user)
    assert flash[:danger]
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: "Example User",
                                           email: "user@example.com", password: "password",
                                           password_confirmation: "password"}
    end
    assert_redirected_to user_path(@user)
    assert flash[:danger]
  end
end
