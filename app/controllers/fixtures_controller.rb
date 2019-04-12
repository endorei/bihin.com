class FixturesController < ApplicationController
  before_action :require_admin_logged_in, only: [:create]
  
  def index
    q = params[:query]
    @fixtures = q ? Fixture.where('(name LIKE ?) OR (type_number LIKE ?)', "%#{q}%", "%#{q}%") : Fixture.all
    @fixtures = @fixtures.order(created_at: 'DESC').page(params[:page]).per(20)
    
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
  
  def destroy
    @fixture = Fixture.find(params[:id])
    @fixture.destroy

    flash[:success] = '備品は正常に削除されました'
    redirect_to fixtures_path
  end
  
  def delete_all
    params[:fixture][:id].each do |id|
      fixture = Fixture.find_by(id: id) if id != 0 && id != "0"
      fixture.destroy if fixture.present?
    end
    
      redirect_to action: 'index'
  end

  private

  def fixture_params
    params.require(:fixture).permit(:name, :type_number, :note, :room_id)
  end
end
