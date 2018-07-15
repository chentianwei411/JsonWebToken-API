class ApplicationController < ActionController::API
  attr_accessor :current_user

  protected

  def authenticate!
    unless token?
      return render_failed
    end
    @current_user = User.find_by_id(auth_token[:user_id])
  rescue JWT::ExpiredSignature
    render_failed ["授权已过期"]
  rescue JWT::VerificationError, JWT::DecodeError
    render_failed
  end

  private

  def token?
    #auth_token[:user_id].to_i 作为条件之一，payload中必须包含它。
    http_token && auth_token && auth_token[:user_id].to_i
  end

  def http_token
    @http_token = if request.headers['Authorization'].present?
                    request.headers['Authorization'].split(" ").last
                  end
  end

  def auth_token
    @auth_token ||= Token.decode(http_token)
  end

  def render_failed(messages = ["验证失败"])
    render json: { errors: messages}, status: :unauthorized
  end
end
