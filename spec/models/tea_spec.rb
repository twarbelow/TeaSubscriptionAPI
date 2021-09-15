require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'relationships' do
    it { should have_many(:subscriptions) }
    it { should have_many(:customers).through(:subscriptions) }
  end
end
