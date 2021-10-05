class Api::V1::CustomersController < ApplicationController
  def create
    if !Customer.exists?(email: params[:email])
      customer = Customer.create!(name: params[:name], email: params[:email])
      render json: CustomerSerializer.render(customer), status: :created
    end
  end
end
