class Booking < ApplicationRecord
  belongs_to :fridge
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :status, inclusion: { in: ["pending", "declined", "accepted"] }
end
