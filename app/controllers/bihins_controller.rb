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
    @user = User
  end
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
#    @bihins = Bihin.search(params[:search])
#    def self.search(search)
#      if search
#        Post.where(['content LIKE ?', "%#{search}%"])
#      else
#        Post.all
#      end
#    end
#    puts params[:search]
  end
end