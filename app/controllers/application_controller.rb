class ApplicationController < ActionController::API

  def token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def hmac_secret
    ENV["API_SECRET_KEY"]
  end

  def client_has_valid_token?
    token = request.headers["Authorization"]
    !!current_user_id && current_user.token == token
  end

  def current_user_id
    begin
      token = request.headers["Authorization"]
      decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
      payload = decoded_array.first
    rescue #JWT::VerificationError
      return nil
    end
    payload["user_id"]
  end

  def current_user
    @current_user ||= User.find_by(id: current_user_id) if current_user_id
  end

  def current_shopping_cart(user)
    @current_shopping_cart ||= ShoppingCart.find_by(id: user.current_card_id) if user.current_card_id
  end

  # def require_login
  #   render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
  # end
end
