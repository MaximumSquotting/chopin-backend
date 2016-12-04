class Offer < ApplicationRecord
  validates :name, :cost_per_person, :max_number_of_people, :OfferDate, presence: true
  validates :cost_per_person, :max_number_of_people, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  belongs_to :user

  has_many :payments
  has_many :eaters, through: :payments, source: :user
end
