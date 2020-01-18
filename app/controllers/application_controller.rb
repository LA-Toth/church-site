class ApplicationController < ActionController::API
  attr_reader :current_user
  before_action :may_authenticate_request

  def logged_in?
    current_user.present?
  end

  private

  def may_authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers, optional: true).result
  end
end
