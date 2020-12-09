class BeerSerializer < ActiveModel::Serializer
  # TO DO
  # Also can I show different info for show and index?
  # Sending brewery doesn't serialize
  attributes :id, :name, :style, :ibu, :abv, :brewery
end
