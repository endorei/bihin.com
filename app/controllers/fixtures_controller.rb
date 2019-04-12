class FixturesController < ApplicationController
  before_action :require_admin_logged_in, only: [:create]
  
  def index
    @fixtures = Fixture.all.page(params[:page])
    
    @fixture = Fixture.new
  end

  def create
    @fixture = Fixture.new(fixture_params)

    if @fixture.save
      flash.now[:success] = '備品を登録しました。'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '備品の登録に失敗しました。'
      render :index
    end
  end

  def test
    
  end

  private

  def fixture_params
    params.require(:fixture).permit(:name, :type_number, :note, :room_id)
  end
end
