# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApplicationController
      def create
        if Customer.exists?(email: params[:email])
          render status: :bad_request
        else
          customer = Customer.create!(name: params[:name], email: params[:email])
          render json: CustomerSerializer.render(customer), status: :created
        end
      end
    end
  end
end
