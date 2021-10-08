class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.decimal :total, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
