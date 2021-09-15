class Subscription < ApplicationRecord
  validates :active, presence: true
  
  belongs_to :customer
  belongs_to :tea
end
