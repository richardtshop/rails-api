class SingleBrewerySerializer < ActiveModel::Serializer
  has_many :beers, serializer: BeerSerializer
  attributes :id, :name, :address, :city, :website, :taproom, :restaurant, :beers
end




