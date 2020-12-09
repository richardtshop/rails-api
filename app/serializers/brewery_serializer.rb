class BrewerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :website, :taproom, :restaurant
end
