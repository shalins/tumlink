require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

	test "that the /login route opens the login page" do
		get '/login'
		assert_response :success
	end

	test "that the /logout route opens the logout page" do
		get '/logout'
		assert_response :redirect
		assert_redirected_to '/' 
	end

test "that the /register route opens the register page" do
		get '/register'
		assert_response :success
	end
	
test "that a profile page works" do
	get '/shalin'
	assert_response :success
end	

end
  
