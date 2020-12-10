require 'test_helper'

class BreweriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @brewery = breweries(:dominion)
  end

  test "should get index" do
    get breweries_url
    assert_response :success
  end

  test "should get show" do
    get brewery_url(@brewery)
    assert_response :success
  end

  test "should 404 on show for non-existent brewery" do
    get brewery_url(id: -1)
    assert_response :not_found
  end


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


  test "should update brewery" do
    @new_name = "New name"
    patch brewery_url(@brewery), params: {
      brewery: {
        name: @new_name
      }
    }
    @brewery.reload
    assert_response :success
    assert_equal @brewery.name, @new_name.downcase!
  end


  test "should 404 update brewery that doesn't exist" do
    @new_name = "New name"
    patch brewery_url(-1), params: {
      brewery: {
        name: @new_name
      }
    }
    assert_response :not_found
  end

  test "should delete brewery" do
    assert_difference 'Brewery.count', -1 do
      delete brewery_url(@brewery)
    end
  end

  test "should delete also deletes brewery beers" do
    assert_difference 'Beer.count', -2 do
      delete brewery_url(@brewery)
    end
  end

end


