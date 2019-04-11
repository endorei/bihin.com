class BihinsController < ApplicationController
  def index
  end
  def result
    @fixture = Fixture
    @room = Room
    @user = User
    @rentalHistory = RentalHistory
  end
  def management
  end
  def mypage
  end
  def member
  end
end