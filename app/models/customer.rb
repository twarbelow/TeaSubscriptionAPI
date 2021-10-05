# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :subscriptions
  has_many :teas, through: :subscriptions
end
