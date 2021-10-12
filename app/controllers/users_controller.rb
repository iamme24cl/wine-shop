class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      cookies[:user_id] = user.id
      cart = user.shopping_carts.create!
      user.current_card_id = cart.id

      render json: {
        status: 200,
        user: user,
        cart: cart,
        cart_items: cart.shopping_cart_items
      }
    else
      render json: {status: 501, message: user.errors.full_messages}
    end
  end

  def login_status
    if current_user
      render json: {
        logged_in: true,
        user: current_user,
        cart: current_shopping_cart,
        cart_items: current_shopping_cart.shopping_cart_items
      }
    else
      render json: {logged_in: false, message: "Please log in."}
    end
  end

  def update
    user = User.find_by(id: params[:user_id]);
    user.update(user_params)
    if user.save
      render json: {
        status: 200,
        user: user,
        cart: current_shopping_cart,
        cart_items: current_shopping_cart.shopping_cart_items
      }
    else
      render json: {status: 501, message: user.errors.full_messages}
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
