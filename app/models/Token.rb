class Token
  # ActionController::HttpAuthentication::Token

  def self.encode(payload)
    # 默认使用HS256算法algorithm, 也可以使用HS512等alogrithm
    expiration = 60.minutes.from_now.to_i
    payload.merge!(exp: expiration)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
    # JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS512')
  end

  def self.decode(token)
    # Implements a hash where keys :foo and "foo" are considered to be the same.
    HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.credentials.secret_key_base, true)[0])
  end
end
