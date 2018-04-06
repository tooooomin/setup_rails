# frozen_string_literal: true

Rails.application.routes.draw do
  resources :developers

  namespace :api do
    namespace :v1 do
      resources :developers, only: [:show]
    end
  end

end
