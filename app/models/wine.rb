class Wine < ApplicationRecord
  belongs_to :varietal
  has_many :shopping_cart_items
end
