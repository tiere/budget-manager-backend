# frozen_string_literal: true
class AuthenticationController < ApplicationController
  def sign_in
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      render json: { token: JWTHandler.token_for(user) }
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
