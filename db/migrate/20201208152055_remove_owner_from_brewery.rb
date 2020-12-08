class RemoveOwnerFromBrewery < ActiveRecord::Migration[6.0]
  def change
    remove_column :breweries, :owner, :string
  end
end
