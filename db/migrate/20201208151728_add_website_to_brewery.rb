class AddWebsiteToBrewery < ActiveRecord::Migration[6.0]
  def change
    add_column :breweries, :website, :string
  end
end
