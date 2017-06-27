require 'test_helper'

class GrapesortsControllerTest < ActionController::TestCase
  setup do
    @grapesort = grapesorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grapesorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grapesort" do
    assert_difference('Grapesort.count') do
      post :create, grapesort: { date_of_collection: @grapesort.date_of_collection, name: @grapesort.name, place_of_production: @grapesort.place_of_production }
    end

    assert_redirected_to grapesort_path(assigns(:grapesort))
  end

  test "should show grapesort" do
    get :show, id: @grapesort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grapesort
    assert_response :success
  end

  test "should update grapesort" do
    patch :update, id: @grapesort, grapesort: { date_of_collection: @grapesort.date_of_collection, name: @grapesort.name, place_of_production: @grapesort.place_of_production }
    assert_redirected_to grapesort_path(assigns(:grapesort))
  end

  test "should destroy grapesort" do
    assert_difference('Grapesort.count', -1) do
      delete :destroy, id: @grapesort
    end

    assert_redirected_to grapesorts_path
  end
end
