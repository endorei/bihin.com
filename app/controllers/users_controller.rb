class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :require_admin_logged_in, only: [:index]
  
  def index
    q = params[:query]
    @users = q ? User.where('(name LIKE ?) OR (employee_id LIKE ?)', "%#{q}%", "%#{q}%") : User.all
    @users = @users.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @rental_histories = RentalHistory.where(user: @user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'ユーザー情報は正常に更新されました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザー情報は更新されませんでした'
      redirect_to @user
    end
  end
  
  def destroy
    @user = Message.find(params[:id])
    @user.destroy

    flash[:success] = 'ユーザーは正常に削除されました'
    redirect_to root_path
  end

  private

  def user_params
    # power は入力させない
    params.require(:user).permit(:name, :employee_id, :email, :department, :password, :password_confirmation)
  end
end
