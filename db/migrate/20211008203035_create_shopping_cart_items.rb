class CreateShoppingCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_cart_items do |t|
      t.integer :quantity
      t.integer :wine_id
      t.integer :shopping_cart_id
      t.decimal :total, precision: 10, scale: 2
      t.decimal :unit_price, precision: 10, scale: 2
      t.string :image
      t.string :name

      t.timestamps
    end
  end
end
