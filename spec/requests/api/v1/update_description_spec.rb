require 'rails_helper'

RSpec.describe 'subscription creation' do
  it 'accepts json body and post to create' do
    customer = create(:customer)
    tea = create(:tea)
    subscription = create(:subscription, tea_id: tea.id, customer_id: customer.id)
    json_body = {"active": "false"}

    post "/api/v1/subscriptions/:id", params: json_body

    expect(response.status).to eq(201)

    reply = JSON.parse(response.body, symbolize_names: true)

    expect(reply[:data][:id]).to be_an(subscription.id)
    expect(reply[:data][:type]).to eq("subscription")
    expect(reply[:data][:attributes][:customer_id]).to eq(customer.id)
    expect(reply[:data][:attributes][:tea_id]).to eq(tea.id)
    expect(reply[:data][:attributes][:active]).to eq(false)
  end
end
