require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup 
  	@user = User.new(name: "Exmaple User", occupation: "example", password: "passcode", password_confirmation: "passcode")
  end

  test "should be valid " do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "        "
  	assert_not @user.valid?
  end

  test "occupation should be present" do
  	@user.occupation = "          "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "occupation should not be too long" do
  	@user.occupation = "a" * 25
  	assert_not @user.valid?
  end

  test "name should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.name = @user.name.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "name should be saved as lower-case" do
  	mixed_case_name = "Michael ZAYn"
  	@user.name = mixed_case_name
  	@user.save
  	assert_equal mixed_case_name.downcase, @user.reload.name
  end

  test "password should be present (nonblank)" do
  	@user.password = @user.password_confirmation = " " * 6
  	assert_not @user.valid?
  end

  test "password should have a minimum length" do
  	@user.password = @user.password_confirmation = "a" * 5
  	assert_not @user.valid?
  end
  

end
