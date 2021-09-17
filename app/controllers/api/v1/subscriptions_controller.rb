class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(customer_id: params[:id], tea_id: params[:tea_id], active: true)
    render json: SubscriptionSerializer.render(subscription), status: :created
  end
end
