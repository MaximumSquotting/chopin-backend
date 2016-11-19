class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :address, :email, presence: true

  has_many :payments
  has_many :dinners, through: :payments, source: :offer
  has_many :offers
end
