class SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      if !current_shopping_cart(user)
        @current_shopping_cart = user.shopping_carts.create!
        user.current_card_id = @current_shopping_cart.id
      end

      user.token = token(user.id)
      user.save

      render json: {
        status: 200,
        logged_in: true,
        user: user,
        cart: @current_shopping_cart,
        cart_items: @current_shopping_cart.shopping_cart_items
      }
    else
      render json: { errors: 'Authentication Failed!', status: 401}
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.token = nil
    render json: {status: 200, message: "Successfully logged out."}
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end

end
