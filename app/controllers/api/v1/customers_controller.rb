# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApplicationController
      def create
        if !Customer.exists?(email: params[:email]) && valid_params?
          customer = Customer.create!(name: params[:name], email: params[:email])
          render json: CustomerSerializer.render(customer), status: :created
        else
          render status: :bad_request
        end
      end

      private

      def valid_params?
        params[:name].present? && params[:email].present?
      end
    end
  end
end
