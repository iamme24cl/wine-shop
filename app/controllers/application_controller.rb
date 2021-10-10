class ApplicationController < ActionController::API
  include ActionController::Cookies

  def current_user
    @current_user ||= User.find_by(id: cookies[:user_id] if cookies[:user_id])
  end

  def current_shopping_cart
    @current_shopping_cart ||= ShoppingCart.find_by(
      id: current_user.current_card_id if current_user.current_card_id
    )
  end
end
