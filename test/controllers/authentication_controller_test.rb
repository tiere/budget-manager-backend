# frozen_string_literal: true
require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "/sign_in" do
    post sign_in_url

    assert_response :success
  end
end
