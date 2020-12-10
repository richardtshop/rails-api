class BeerSerializer < ActiveModel::Serializer

  attributes :id, :name, :style, :ibu, :abv, :brewery, :brewery_id

  def brewery
    object.brewery.name
  end
end
