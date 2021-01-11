# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  protected

  def authenticate_request!
    return invalid_authentication if !payload || !AuthenticationTokenService.valid_payload(payload.first)

    load_current_user!
    invalid_authentication unless @current_user
  end

  def invalid_authentication
    render json: { error: 'You will need to login first' }, status: :unauthorized
  end

  private

  def not_destroyed(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    AuthenticationTokenService.decode(token)
  rescue StandardError
    nil
  end

  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
end

