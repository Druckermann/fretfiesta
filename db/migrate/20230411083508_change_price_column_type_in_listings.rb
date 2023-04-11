class ChangePriceColumnTypeInListings < ActiveRecord::Migration[7.0]
  def change
    change_column :listings, :price, :integer, using: 'price::integer'
  end
end
