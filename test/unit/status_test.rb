require 'test_helper'

class StatusTest < ActiveSupport::TestCase

  test "that a status requires that content be entered" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that the status content is at least two letters long" do
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

 test "a status should have a user id" do
  status = Status.new
  status.content = "Hello"
  assert !status.save
  assert !status.errors[:user_id].empty?
end

end
