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
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'James', last_name: 'Martin', email: 'shalin.vs@gmail.com')
    user.password = user.password_confirmation = 'svshah1999'
    user.profile_name = "Profile with spaces"
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "user can have a correctly formatted profile name" do
    user = User.new(first_name: 'James', last_name: 'Martin', email: 'shalin.vs@gmail.com')
    user.password = user.password_confirmation = 'svshah1999'
    user.profile_name = 'james'
    assert user.valid?
  end



end
