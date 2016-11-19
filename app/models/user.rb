class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User

  validates :name, :address, :email, presence: true

  has_many :payments
  has_many :dinners, through: :payments, source: :offer
  has_many :offers
end
