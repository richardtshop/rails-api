class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :ibu
      t.string :abv
      t.references :brewery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
