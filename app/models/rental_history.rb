class RentalHistory < ApplicationRecord
  belongs_to :user
  belongs_to :fixture
end
