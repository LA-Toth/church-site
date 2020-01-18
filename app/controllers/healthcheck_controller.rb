class HealthcheckController < ApplicationController
  def index
    render json: { success: true, logged_in: current_user.present? }
  end
end
