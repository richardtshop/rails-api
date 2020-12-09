require 'test_helper'

class BeerTest < ActiveSupport::TestCase

  def setup
    @beer = beers(:trouble)
  end

  test "beer should be valid" do
    assert @beer.valid?
  end
end
