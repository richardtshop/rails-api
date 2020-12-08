class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :owner
      t.boolean :taproom
      t.boolean :restaurant

      t.timestamps
    end
  end
end
