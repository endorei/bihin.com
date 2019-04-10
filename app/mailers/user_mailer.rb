class UserMailer < ApplicationMailer
  default from: 'bihin.com748@gmail.com'
 
  def reset_password(user, new_password)
    @user = user
    @new_password = new_password
    @login_url = 'http://example.com/login'
    mail(to: user.email, subject: 'パスワード再発行のお知らせ')
  end
end