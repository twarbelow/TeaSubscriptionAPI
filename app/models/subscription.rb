# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates :active, presence: false

  belongs_to :customer
  belongs_to :tea
end
