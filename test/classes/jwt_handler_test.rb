# frozen_string_literal: true
class JWTHandlerTest < ActiveSupport::TestCase
  test ".token_for" do
    user  = users(:one)
    token = JWTHandler.token_for(user)

    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)
    token_payload = decoded_token[0]

    assert_equal user.id, token_payload["sub"].split(":")[1].to_i
    assert_in_delta 1.month.from_now.to_i, token_payload["exp"], 10
  end
end
