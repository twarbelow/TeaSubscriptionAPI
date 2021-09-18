class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    if Customer.find(params[:id])
      subscriptions = Subscription.where(customer_id: params[:id], active: :desc)
      render json: SubscriptionSerializer.render_all(subscriptions), status: :ok
    end
  end
end
