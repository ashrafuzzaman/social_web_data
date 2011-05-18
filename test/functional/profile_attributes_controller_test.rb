require 'test_helper'

class ProfileAttributesControllerTest < ActionController::TestCase
  setup do
    @profile_attribute = profile_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_attribute" do
    assert_difference('ProfileAttribute.count') do
      post :create, :profile_attribute => @profile_attribute.attributes
    end

    assert_redirected_to profile_attribute_path(assigns(:profile_attribute))
  end

  test "should show profile_attribute" do
    get :show, :id => @profile_attribute.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @profile_attribute.to_param
    assert_response :success
  end

  test "should update profile_attribute" do
    put :update, :id => @profile_attribute.to_param, :profile_attribute => @profile_attribute.attributes
    assert_redirected_to profile_attribute_path(assigns(:profile_attribute))
  end

  test "should destroy profile_attribute" do
    assert_difference('ProfileAttribute.count', -1) do
      delete :destroy, :id => @profile_attribute.to_param
    end

    assert_redirected_to profile_attributes_path
  end
end
