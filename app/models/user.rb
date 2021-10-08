class User < ApplicationRecord
  has_secure_passoword
  has_one :shopping_cart

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
