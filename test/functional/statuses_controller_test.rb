require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected when user is not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the page when you are logged in" do
    sign_in users(:shalin)
    get :new
    assert_response :success    
  end

  test "should be logged in to post a status" do
    post :create, status: { content: 'Hello' } 
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should be logged in to update a status" do
    put :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should be logged in to edit a status" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  

  test "should create status when logged in" do
    sign_in users(:shalin)
    assert_difference('Status.count') do
    post :create, status: { content: @status.content}
  end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit if logged in" do
    sign_in users(:shalin)
    get :edit, id: @status
    assert_response :success
  end

  test "should update status if logged in" do
    sign_in users(:shalin)
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status when logged in" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
