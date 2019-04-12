class FixturesController < ApplicationController
  before_action :require_admin_logged_in, only: [:create]
  
  def index
    q = params[:query]
    @fixtures = q ? Fixture.where('(name LIKE ?) OR (type_number LIKE ?)', "%#{q}%", "%#{q}%") : Fixture.all
    @fixtures = @fixtures.page(params[:page]).per(20)
    
    @fixture = Fixture.new
    @rental_history = RentalHistory.new
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
