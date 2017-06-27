require 'test_helper'

class VarietywinesControllerTest < ActionController::TestCase
  setup do
    @varietywine = varietywines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:varietywines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create varietywine" do
    assert_difference('Varietywine.count') do
      post :create, varietywine: { aging_in_barrels: @varietywine.aging_in_barrels, aging_in_bottles: @varietywine.aging_in_bottles, color: @varietywine.color, name: @varietywine.name, type_of_wine: @varietywine.type_of_wine }
    end

    assert_redirected_to varietywine_path(assigns(:varietywine))
  end

  test "should show varietywine" do
    get :show, id: @varietywine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @varietywine
    assert_response :success
  end

  test "should update varietywine" do
    patch :update, id: @varietywine, varietywine: { aging_in_barrels: @varietywine.aging_in_barrels, aging_in_bottles: @varietywine.aging_in_bottles, color: @varietywine.color, name: @varietywine.name, type_of_wine: @varietywine.type_of_wine }
    assert_redirected_to varietywine_path(assigns(:varietywine))
  end

  test "should destroy varietywine" do
    assert_difference('Varietywine.count', -1) do
      delete :destroy, id: @varietywine
    end

    assert_redirected_to varietywines_path
  end
end
