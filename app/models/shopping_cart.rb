class ShoppingCart < ApplicationRecord
  has_many :shopping_cart_items
  belongs_to :user, optional: true
end
