# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /authenticate' do
    let(:user) { FactoryBot.create(:user, username: 'BookSeller99', password: 'password') }

    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'password' }

      expect(response).to have_http_status(:created)
      expect(response_body).to eq({
                                    'token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.XE4MyVmqX2d1ZCgjfe3jadctO-vC7n3rim6j0vu0P9A'
                                  })
    end

    it 'returns error when username is missing' do
      post '/api/v1/authenticate', params: { password: 'password' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({
                                    'error' => 'param is missing or the value is empty: username'
                                  })
    end

    it 'returns error when password is missing' do
      post '/api/v1/authenticate', params: { username: user.username }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({
                                    'error' => 'param is missing or the value is empty: password'
                                  })
    end

    it 'returns error when password is incorrect' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'incorrect' }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
