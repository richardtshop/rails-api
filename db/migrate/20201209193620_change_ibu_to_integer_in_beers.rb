class ChangeIbuToIntegerInBeers < ActiveRecord::Migration[6.0]
  def change
    change_column :beers, :ibu, :integer
  end
end
