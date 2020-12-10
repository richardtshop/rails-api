require 'test_helper'

class BeersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @beer = beers(:trouble)
  end

  test "should get index" do
    get beers_url
    assert_response :success
  end

  test "should get show" do
    get beer_url(@beer)
    assert_response :success
  end

  test "should 404 on show for non-existent beer" do
    get beer_url(id: -1)
    assert_response :not_found
  end

  test "should create beer with correct parameters" do
    post beers_url, params: {
      beer: {
        name: "test beer",
        style: "ale",
        ibu: 80,
        abv: "5%",
        brewery_id: 1,
      },
    }
    assert_response :success
  end

  test "should  create beer with non unique name and but different brewery" do
    post beers_url, params: {
      beer: {
        name: @beer.name,
        style: "ale",
        ibu: 80,
        abv: "5%",
        brewery_id: 2,
      },
    }
    assert_response :success

  end

  test "should fail to create beer with non unique name and brewery combination" do
    post beers_url, params: {
      beer: {
        name: @beer.name,
        style: "ale",
        ibu: 80,
        abv: "5%",
        brewery_id: 1,
      },
    }
    assert_response :unprocessable_entity
  end

  test "should fail to create beer with empty parameters" do
    post beers_url, params: {
      beer: {
        name: "",
        style: "",
        ibu: "",
        abv: "",
        brewery_id: "",
      },
    }
    assert_response :unprocessable_entity
  end


  test "should fail to create beer with missing parameters" do
    post beers_url, params: {
      beer: {
        name: @beer.name,
        style: "ale",
        abv: "5%",
        brewery_id: 1,
      },
    }
    assert_response :unprocessable_entity
  end

  test "should update beer" do
    @new_name = "New name"
    patch beer_url(@beer), params: {
      beer: {
        name: @new_name
      }
    }

    @beer.reload
    assert_equal @beer.name, @new_name.downcase!
  end


  test "should 404 update beer that doesn't exist" do
    @new_name = "New name"
    patch beer_url(-1), params: {
      beer: {
        name: @new_name
      }
    }
    assert_response :not_found
  end

  test "should delete beer" do
    assert_difference 'Beer.count', -1 do
      delete beer_url(@beer)
    end
  end
end
