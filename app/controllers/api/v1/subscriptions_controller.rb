class Api::V1::SubscriptionsController < ApplicationController
  def update
    if params[:active] == "true" || params[:active] == "false"
      subscription = Subscription.find(params[:id])
      subscription.update(active: ActiveModel::Type::Boolean.new.cast(params[:active]))
      render json: SubscriptionSerializer.render(subscription), status: :ok
    else
      render status: :bad_request
    end
  end
end
