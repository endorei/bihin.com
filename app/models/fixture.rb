class Fixture < ApplicationRecord
  belongs_to :room
  has_many :rental_histories, :dependent => :destroy
  
  def rent
    rental_histories.where(returned_at: nil).present?
  end
  
  def rent_user
     rental_histories.find_by(returned_at: nil).user if rent
  end
end
