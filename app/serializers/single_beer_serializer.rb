class SingleBeerSerializer < ActiveModel::Serializer

  attributes :id, :name, :style, :ibu, :abv, :brewery

  def brewery
    BrewerySerializer.new(object.brewery)
  end
end
