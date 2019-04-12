class RentalHistoriesController < ApplicationController
  
  
  def new
    @rental_history = RentalHistory.new
  end

  def create
    p = rh_params
    p[:expected_return_at] = Time.new(p[:expected_return_at])
    @rental_history = RentalHistory.new(p)

    if @rental_history.save
       flash.now[:success] = '借りました'
       redirect_to fixtures_url
    else
      flash.now[:danger] = '失敗しました。'
      redirect_to fixtures_url
    end
  end



  private

  def rh_params
    # power は入力させない
    params.require(:rental_history).permit(:user, :fixture, :expected_return_at, :note)
  end
end
