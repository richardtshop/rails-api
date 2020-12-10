class BrewerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :website, :taproom, :restaurant, :total_beers

  def total_beers
     object.beers.count
  end
end




