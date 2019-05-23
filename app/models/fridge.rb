class Fridge < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
end
