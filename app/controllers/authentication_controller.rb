# frozen_string_literal: true
class AuthenticationController < ApplicationController
  def sign_in
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: { token: JWTHandler.token_for(user) }
    else
      head :unauthorized
    end
  end
end
