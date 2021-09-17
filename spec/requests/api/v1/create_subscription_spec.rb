require 'rails_helper'

RSpec.describe 'subscription creation' do
  it 'accepts json body and post to create' do
    customer = create(:customer)
    tea = create(:tea)
    json_body = {"tea_id": tea.id}

    post "/api/v1/customers/#{customer.id}/subscription", params: json_body

    expect(response.status).to eq(201)

    reply = JSON.parse(response.body, symbolize_names: true)

    expect(reply[:data][:id]).to be_an(Integer)
    expect(reply[:data][:type]).to eq("subscription")
    expect(reply[:data][:attributes][:customer_id]).to eq(customer.id)
    expect(reply[:data][:attributes][:tea_id]).to eq(json_body[:tea_id])
    expect(reply[:data][:attributes][:active]).to eq(true)
  end
end
