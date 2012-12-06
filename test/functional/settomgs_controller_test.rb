require 'test_helper'

class SettomgsControllerTest < ActionController::TestCase
  setup do
    @settomg = settomgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settomgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settomg" do
    assert_difference('Settomg.count') do
      post :create, settomg: { blurb: @settomg.blurb, description: @settomg.description, email: @settomg.email, phone: @settomg.phone, title: @settomg.title }
    end

    assert_redirected_to settomg_path(assigns(:settomg))
  end

  test "should show settomg" do
    get :show, id: @settomg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settomg
    assert_response :success
  end

  test "should update settomg" do
    put :update, id: @settomg, settomg: { blurb: @settomg.blurb, description: @settomg.description, email: @settomg.email, phone: @settomg.phone, title: @settomg.title }
    assert_redirected_to settomg_path(assigns(:settomg))
  end

  test "should destroy settomg" do
    assert_difference('Settomg.count', -1) do
      delete :destroy, id: @settomg
    end

    assert_redirected_to settomgs_path
  end
end
