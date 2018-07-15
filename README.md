# JsonWebToken的简单应用：

### 测试:
<br>
curl -X POST -d name="wang" -d password="123123" http://localhost:3000/authentication

- 输出：{"token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MzE2NTg3MzV9.7Ntqzl470OwtT4Q-GKwMz1me53jtmhvTnASwlNWAWlY"}%
<br>

curl -v --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MzE2NTg3MzV9.7Ntqzl470OwtT4Q-GKwMz1me53jtmhvTnASwlNWAWlY" http://localhost:3000/users

- 输出：
...略
{"name":"wang","email":"wang@gmail.com"}%


### 参考资料：
- https://gorails.com/episodes/jwt-authentication-from-scratch-with-rails?autoplay=1
- https://www.jianshu.com/p/56467f890516
- https://jwt.io/
- https://github.com/jwt/ruby-jwt

### 备注：
测试expire, 可以在Token.rb的encode类方法中改：
expiration = 0.minutes.from_now.to_i
输入上面的crul，会raise错误提示{"errors":["授权已过期"]}%
