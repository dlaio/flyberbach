require 'test_helper'

class FlightLegsControllerTest < ActionController::TestCase
  setup do
    @flight_leg = flight_legs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flight_legs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight_leg" do
    assert_difference('FlightLeg.count') do
      post :create, flight_leg: { flight_no: @flight_leg.flight_no, leg_no: @flight_leg.leg_no, price: @flight_leg.price, route_id: @flight_leg.route_id }
    end

    assert_redirected_to flight_leg_path(assigns(:flight_leg))
  end

  test "should show flight_leg" do
    get :show, id: @flight_leg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight_leg
    assert_response :success
  end

  test "should update flight_leg" do
    patch :update, id: @flight_leg, flight_leg: { flight_no: @flight_leg.flight_no, leg_no: @flight_leg.leg_no, price: @flight_leg.price, route_id: @flight_leg.route_id }
    assert_redirected_to flight_leg_path(assigns(:flight_leg))
  end

  test "should destroy flight_leg" do
    assert_difference('FlightLeg.count', -1) do
      delete :destroy, id: @flight_leg
    end

    assert_redirected_to flight_legs_path
  end
end
