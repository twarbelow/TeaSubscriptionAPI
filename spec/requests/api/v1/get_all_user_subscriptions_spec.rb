require 'rails_helper'

RSpec.describe 'get all user subscriptions' do
  it 'accepts json body and get to retrieve' do
    customer = create(:customer)
    create(:customer)
    tea = create(:tea)
    tea1 = create(:tea)
    tea2 = create(:tea)
    subscription = create(:subscription, tea_id: tea.id, customer_id: customer.id, active: true)
    subscription1 = create(:subscription, tea_id: tea1.id, customer_id: customer.id, active: true)
    subscription2 = create(:subscription, tea_id: tea2.id, customer_id: customer.id, active: true)



    get "/api/v1/customers/#{customer.id}/subscriptions"

    expect(response.status).to eq(200)

    reply = JSON.parse(response.body, symbolize_names: true)

    expect(reply[:data]).to be_an(Array)
    expect(reply[:data].count).to eq(3)

    expect(reply[:data][0][:id]).to eq(subscription.id)
    expect(reply[:data][0][:type]).to eq("subscription")
    expect(reply[:data][0][:attributes][:customer_id]).to eq(customer.id)
    expect(reply[:data][0][:attributes][:tea_id]).to eq(tea.id)
    expect(reply[:data][0][:attributes][:active]).to be(subscription.active)

    expect(reply[:data][1][:id]).to eq(subscription1.id)
    expect(reply[:data][1][:type]).to eq("subscription")
    expect(reply[:data][1][:attributes][:customer_id]).to eq(customer.id)
    expect(reply[:data][1][:attributes][:tea_id]).to eq(tea1.id)
    expect(reply[:data][1][:attributes][:active]).to be(subscription1.active)

    expect(reply[:data]).to be_an(Array)
    expect(reply[:data][2][:id]).to eq(subscription2.id)
    expect(reply[:data][2][:type]).to eq("subscription")
    expect(reply[:data][2][:attributes][:customer_id]).to eq(customer.id)
    expect(reply[:data][2][:attributes][:tea_id]).to eq(tea2.id)
    expect(reply[:data][2][:attributes][:active]).to eq(subscription2.active)


  end
end
