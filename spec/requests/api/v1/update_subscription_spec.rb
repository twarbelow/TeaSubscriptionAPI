require 'rails_helper'

RSpec.describe 'subscription update' do
  it 'accepts json body and post to create' do
    customer = create(:customer)
    tea = create(:tea)
    subscription = create(:subscription, tea_id: tea.id, customer_id: customer.id, active: true)
    json_body = {"active": "false"}

    patch "/api/v1/subscriptions/#{subscription.id}", params: json_body

    expect(response.status).to eq(200)

    reply = JSON.parse(response.body, symbolize_names: true)

    expect(reply[:data][:id]).to eq(subscription.id)
    expect(reply[:data][:type]).to eq("subscription")
    expect(reply[:data][:attributes][:customer_id]).to eq(customer.id)
    expect(reply[:data][:attributes][:tea_id]).to eq(tea.id)
    expect(reply[:data][:attributes][:active]).to eq(false)
  end

  it 'returns a 404 response if subscription does not exist' do
    json_body = {"active": "false"}

    patch "/api/v1/subscriptions/123234345", params: json_body

    expect(response.status).to eq(404)
  end

  it 'returns 400 if active param is not true or false' do
    customer = create(:customer)
    tea = create(:tea)
    subscription = create(:subscription, tea_id: tea.id, customer_id: customer.id, active: true)
    json_body = {"active": "kittens"}

    patch "/api/v1/subscriptions/#{subscription.id}", params: json_body

    expect(response.status).to eq(400)
  end
end
