require 'test_helper'

class BreweriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @brewery = breweries(:one)
  end

  test "should get index" do
    get breweries_url
    assert_response :success
  end

  # test "should get show" do
  #   get breweries_show_url
  #   assert_response :success
  # end

  test "should create brewery with correct parameters" do
    post breweries_url, params: {
      brewery: {
        name: "Test brewery",
        address: "123 Fake street",
        city: "Toronto",
        taproom: true,
        restaurant: false,
        website: "https://website.com",
      },
    }
    assert_response :success
  end


  test "should fail to create brewery with duplicate name" do
    post breweries_url, params: {
      brewery: {
        name: @brewery.name,
        address: "123 Fake street",
        city: "Toronto",
        taproom: true,
        restaurant: false,
        website: "https://website.com",
      },
    }
    assert_response :unprocessable_entity
  end

  test "should fail to create brewery with duplicate website" do
    post breweries_url, params: {
      brewery: {
        name: "Test brewery",
        address: "123 Fake street",
        city: "Toronto",
        taproom: true,
        restaurant: false,
        website: @brewery.website,
      },
    }
    assert_response :unprocessable_entity
  end

  test "should fail to create brewery with empty parameters" do
    post breweries_url, params: {
      brewery: {
        name: "",
        address: "",
        city: "",
        taproom: "",
        restaurant: "",
        website: "",
      },
    }
    assert_response :unprocessable_entity
  end


  test "should fail to create brewery with missing parameters" do
    post breweries_url, params: {
      brewery: {
        name: "Test brewery",
        address: "123 Fake Avenue",
        restaurant: true,
        website: "https://website.com",
      },
    }
    assert_response :unprocessable_entity
  end

  test "should fail to create brewery with incorrect format of website" do
    post breweries_url, params: {
      brewery: {
        name: "Test brewery",
        address: "123 Fake street",
        city: "Toronto",
        taproom: true,
        restaurant: false,
        website: "website.com",
      },
    }
    assert_response :unprocessable_entity
  end


  # test "should get update" do
  #   get breweries_update_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get breweries_destroy_url
  #   assert_response :success
  # end

end


