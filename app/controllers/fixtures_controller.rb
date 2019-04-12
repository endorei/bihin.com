class FixturesController < ApplicationController
  before_action :require_admin_logged_in, only: [:create]
  
  def index
    @fixtures = Fixture.all.page(params[:page])
    
    @fixture = Fixture
    @room = Room
    @user = User
    @rentalHistory = RentalHistory
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
