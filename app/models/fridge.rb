class Fridge < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end
