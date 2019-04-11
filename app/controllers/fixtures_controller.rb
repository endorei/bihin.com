class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @fixtures = Fixture.all.page(params[:page])
  end

  def create
    @fixture = Fixture.new(fixture_params)

    if @fixture.save
      flash.now[:success] = '備品を登録しました。'
      render :index
    else
      flash.now[:danger] = '備品の登録に失敗しました。'
      render :index
    end
  end


  private

  def fixture_params
    params.require(:fixture).permit(:name, :type_number, :room, :note)
  end
end
