class User < ApplicationRecord
  has_secure_password

  def token
    # 调用JsonWebToken类方法。产生payload
    { token: Token.encode(user_id: self.id)}
  end

  def to_json
    # 取出2个自动，返回hash结构，同时也符合json结构。
    self.slice(:name, :email)
  end

end
