class Api::V1::SubscriptionsController < ApplicationController
  def create
    if Tea.find(params[:tea_id]) && Customer.find(params[:id])
      subscription = Subscription.create!(customer_id: params[:id], tea_id: params[:tea_id], active: true)
      render json: SubscriptionSerializer.render(subscription), status: :created
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(active: ActiveModel::Type::Boolean.new.cast(params[:active]))
    render json: SubscriptionSerializer.render(subscription), status: :ok
  end
end
