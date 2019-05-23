class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  categories = ["user", "owner"]
  has_many :fridges, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: categories }
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
