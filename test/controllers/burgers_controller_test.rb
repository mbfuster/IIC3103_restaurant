require 'test_helper'

class BurgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @burger = burgers(:one)
  end

  test "should get index" do
    get burgers_url, as: :json
    assert_response :success
  end

  test "should create burger" do
    assert_difference('Burger.count') do
      post burgers_url, params: { burger: { description: @burger.description, image: @burger.image, name: @burger.name, price: @burger.price } }, as: :json
    end

    assert_response 201
  end

  test "should show burger" do
    get burger_url(@burger), as: :json
    assert_response :success
  end

  test "should update burger" do
    patch burger_url(@burger), params: { burger: { description: @burger.description, image: @burger.image, name: @burger.name, price: @burger.price } }, as: :json
    assert_response 200
  end

  test "should destroy burger" do
    assert_difference('Burger.count', -1) do
      delete burger_url(@burger), as: :json
    end

    assert_response 204
  end
end
