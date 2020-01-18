class SessionController < ApplicationController
  def authenticate
    command = AuthenticateUser.call(auth_params[:email], auth_params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
