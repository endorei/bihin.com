class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  def reset_password_form
    # 画面表示
  end
  
  def reset_password
    email = params[:session][:email].downcase
    user = User.find_by(email: email)
    if user
      new_password = generate_password(8)
      user.update(password: new_password)
      # deliver_later で非同期
      UserMailer.reset_password(user, new_password).deliver_later
    end
    # 登録ユーザーでなくても同じ挙動をすることで、
    # アドレスが登録されているか第三者に分からないようにする
    flash[:success] = 'パスワードを再発行しました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
  def generate_password(size)
　　password = [*'A'..'Z', *'a'..'z', *0..9].shuffle[0..size-1].join
　　password
  end
end