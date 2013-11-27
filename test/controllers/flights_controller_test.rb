require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  setup do
    @flight = flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, flight: { airline: @flight.airline, arrive_city: @flight.arrive_city, arrive_time: @flight.arrive_time, cabin_class: @flight.cabin_class, created_at: @flight.created_at, flight_no: @flight.flight_no, leave_city: @flight.leave_city, leave_time: @flight.leave_time, plane_type: @flight.plane_type, price: @flight.price, remark: @flight.remark, updated_at: @flight.updated_at }
    end

    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should show flight" do
    get :show, id: @flight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight
    assert_response :success
  end

  test "should update flight" do
    patch :update, id: @flight, flight: { airline: @flight.airline, arrive_city: @flight.arrive_city, arrive_time: @flight.arrive_time, cabin_class: @flight.cabin_class, created_at: @flight.created_at, flight_no: @flight.flight_no, leave_city: @flight.leave_city, leave_time: @flight.leave_time, plane_type: @flight.plane_type, price: @flight.price, remark: @flight.remark, updated_at: @flight.updated_at }
    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete :destroy, id: @flight
    end

    assert_redirected_to flights_path
  end
end
