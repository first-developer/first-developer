require 'test_helper'

class TutsControllerTest < ActionController::TestCase
  setup do
    @tut = tuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tut" do
    assert_difference('Tut.count') do
      post :create, :tut => @tut.attributes
    end

    assert_redirected_to tut_path(assigns(:tut))
  end

  test "should show tut" do
    get :show, :id => @tut.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tut.to_param
    assert_response :success
  end

  test "should update tut" do
    put :update, :id => @tut.to_param, :tut => @tut.attributes
    assert_redirected_to tut_path(assigns(:tut))
  end

  test "should destroy tut" do
    assert_difference('Tut.count', -1) do
      delete :destroy, :id => @tut.to_param
    end

    assert_redirected_to tuts_path
  end
end
