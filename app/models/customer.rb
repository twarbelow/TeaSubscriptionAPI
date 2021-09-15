class Customer < ApplicationRecord
  validates :name, presence: true

  has_many :subscriptions
  has_many :teas, through: :subscriptions
end
