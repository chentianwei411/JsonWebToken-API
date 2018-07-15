class AuthenticationController < ApplicationController
  # 创建一个user的JsonWebToken
  def create
    if user = User.find_by_name(params[:name]).try(:authenticate, params[:password])
      render json: user.token
    else
      render json: { errors: ['用户名或密码错误！']}, status: :unauthorized
    end
  end
end
