class Api::V1::Customers::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.where(customer_id: params[:id], active: :desc)
    render json: SubscriptionSerializer.render_all(subscriptions), status: :ok
  end
end
