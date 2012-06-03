require 'test_helper'

class VolunteeringsControllerTest < ActionController::TestCase
  setup do
    @volunteering = volunteerings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteering" do
    assert_difference('Volunteering.count') do
      post :create, volunteering: @volunteering.attributes
    end

    assert_redirected_to volunteering_path(assigns(:volunteering))
  end

  test "should show volunteering" do
    get :show, id: @volunteering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volunteering
    assert_response :success
  end

  test "should update volunteering" do
    put :update, id: @volunteering, volunteering: @volunteering.attributes
    assert_redirected_to volunteering_path(assigns(:volunteering))
  end

  test "should destroy volunteering" do
    assert_difference('Volunteering.count', -1) do
      delete :destroy, id: @volunteering
    end

    assert_redirected_to volunteerings_path
  end
end
