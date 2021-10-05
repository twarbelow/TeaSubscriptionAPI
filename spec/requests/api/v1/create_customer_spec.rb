# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customer creation' do
  it 'accepts json body and post to create' do
    email = Faker::Internet.email
    name = Faker::Name.name
    json_body = { "name": name, "email": email }

    post '/api/v1/customers', params: json_body

    expect(response.status).to eq(201)

    reply = JSON.parse(response.body, symbolize_names: true)

    expect(reply[:data][:id]).to be_an(Integer)
    expect(reply[:data][:type]).to eq('customer')
    expect(reply[:data][:attributes][:name]).to eq(name)
    expect(reply[:data][:attributes][:email]).to eq(email)
  end
end
