# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: 'http://localhost:3001'
  namespace :api do
    namespace :v1 do
      resources :books, only: %i[index create destroy]

      post 'authenticate', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end
end
