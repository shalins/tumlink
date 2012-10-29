require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:shalin).profile_name
  	user.first_name = 'Shalin'
  	user.email = 'shalinvs@gmail.com'
  	user.last_name = 'Shah'
  	user.password = 'svshah1999'
  	user.password_confirmation = 'svshah1999'
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "My profile with spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert  user.errors[:profile_name].include?("this must be formatted correctly")
  end

end
