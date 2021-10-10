class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      if !current_shopping_cart
        current_shopping_cart = user.shopping_carts.create!
        user.current_card_id = current_shopping_cart.id
      end

      cookies[:user_id] = user.id
      render json: {
        status: 200,
        logged_in: true,
        user: user,
        cart: current_shopping_cart,
        cart_items: current_shopping_cart.shopping_cart_items
      }
    else
      render json: { errors: 'Authentication Failed!', status: 401}
    end
  end

  def destroy
    cookies[:user_id] = nil
    render json: {status: 200, message: "Successfully logged out."}
  end
end
