# frozen_string_literal: true
require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "/sign_in" do
    post sign_in_url, params: { user: { email: users(:one).email, password: "secret" } }

    assert_response :success

    token = json_response[:token]

    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)

    assert_equal users(:one).id, decoded_token[0]["user_id"]
  end

  test "/sign_in with invalid password" do
    post sign_in_url, params: { user: { email: users(:one).email, password: "invalid" } }

    assert_response :unauthorized
  end

  test "/sign_in with invalid email" do
    post sign_in_url, params: { user: { email: "invalid@example.com", password: "secret" } }

    assert_response :unauthorized
  end
end
