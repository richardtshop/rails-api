class BrewerySerializer < ActiveModel::Serializer
  attributes :name, :address, :city, :website, :taproom, :restaurant
end
