class AddStatusToShoppingCart < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_carts, :status, :string
  end
end
