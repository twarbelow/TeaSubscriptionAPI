class Tea < ApplicationRecord
  validates :title, presence: true

  has_many :subscriptions
  has_many :customers, through: :subscriptions
end
