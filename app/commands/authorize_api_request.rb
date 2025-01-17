class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {}, _optional = false)
    @headers = headers
    @optional = false
  end

  def call
    user
  end

  private

  attr_reader :headers
  attr_reader :optional

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil unless optional
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?

    errors.add(:token, 'Missing token') unless optional
    nil
  end
end
