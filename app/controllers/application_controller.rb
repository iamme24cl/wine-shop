class ApplicationController < ActionController::API
  include ActionController::Cookies

  def current_user
    @current_user ||= User.find_by(id: cookies[:user_id] if cookies[:user_id])
  end

  def current_shopping_cart
    @current_shopping_cart ||= ShopingCart.find_by(id: cookies[:shopping_cart_id] if cookies[:shopping_cart_id])
  end
end
