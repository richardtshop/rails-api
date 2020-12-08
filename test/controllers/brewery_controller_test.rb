require 'test_helper'

class BreweryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brewery_index_url
    assert_response :success
  end

  test "should get show" do
    get brewery_show_url
    assert_response :success
  end

  test "should get create" do
    get brewery_create_url
    assert_response :success
  end

  test "should get update" do
    get brewery_update_url
    assert_response :success
  end

  test "should get destroy" do
    get brewery_destroy_url
    assert_response :success
  end

end
