# frozen_string_literal: true
Rails.application.routes.draw do
  post "sign_in", to: "authentication#sign_in"
end
