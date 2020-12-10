class SingleBrewerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :website, :taproom, :restaurant, :beers

  def beers
     object.beers
  end
end




