require 'test_helper'

class BreweryTest < ActiveSupport::TestCase

  def setup
    @brewery = breweries(:dominion)
  end

  test "brewery should be valid" do
    assert @brewery.valid?
  end
end
