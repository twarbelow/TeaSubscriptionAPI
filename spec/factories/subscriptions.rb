FactoryBot.define do
  factory :subscription do
    customer { nil }
    tea { nil }
    active { false }
  end
end
