class Booking < ApplicationRecord
  belongs_to :fridge
  belongs_to :user
end
