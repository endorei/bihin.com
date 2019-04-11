class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :require_admin_logged_in, only: [:index]
  
  def index
    q = params[:query]
    @users = User.all unless q User.where('(name LIKE ?) OR (employee_id LIKE ?)', "%#{q}%", "%#{q}%")
    @users = @users.page(params[:page])
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


  private

  def user_params
    # power は入力させない
    params.require(:user).permit(:name, :employee_id, :email, :department, :password, :password_confirmation)
  end
end
