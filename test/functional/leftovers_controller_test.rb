require 'test_helper'

class LeftoversControllerTest < ActionController::TestCase
  setup do
    @leftover = leftovers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leftovers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leftover" do
    assert_difference('Leftover.count') do
      post :create, leftover: { expires_at: @leftover.expires_at, name: @leftover.name, serving_size: @leftover.serving_size, user_id: @leftover.user_id }
    end

    assert_redirected_to leftover_path(assigns(:leftover))
  end

  test "should show leftover" do
    get :show, id: @leftover
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leftover
    assert_response :success
  end

  test "should update leftover" do
    put :update, id: @leftover, leftover: { expires_at: @leftover.expires_at, name: @leftover.name, serving_size: @leftover.serving_size, user_id: @leftover.user_id }
    assert_redirected_to leftover_path(assigns(:leftover))
  end

  test "should destroy leftover" do
    assert_difference('Leftover.count', -1) do
      delete :destroy, id: @leftover
    end

    assert_redirected_to leftovers_path
  end
end
