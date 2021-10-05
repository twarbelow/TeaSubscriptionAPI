# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApplicationController
      def create
        unless Customer.exists?(email: params[:email])
          customer = Customer.create!(name: params[:name], email: params[:email])
          render json: CustomerSerializer.render(customer), status: :created
        end
      end
    end
  end
end
