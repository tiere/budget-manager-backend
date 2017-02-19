# frozen_string_literal: true
class JWTHandler
  class << self
    def token_for(user)
      payload = {
        sub: "User:#{user.id}",
        exp: 1.month.from_now.to_i,
      }

      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  end
end
