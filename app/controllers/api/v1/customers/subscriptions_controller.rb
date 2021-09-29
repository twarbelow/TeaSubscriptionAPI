class Api::V1::Customers::SubscriptionsController < ApplicationController
  def create
    if Tea.find(params[:tea_id]) && Customer.find(params[:id])
      subscription = Subscription.create!(customer_id: params[:id], tea_id: params[:tea_id], active: true)
      render json: SubscriptionSerializer.render(subscription), status: :created
    end
  end

  def index
    if Customer.find(params[:id])
      subscriptions = Subscription.where(customer_id: params[:id])
      render json: SubscriptionSerializer.render_all(subscriptions), status: :ok
    end
  end
end
