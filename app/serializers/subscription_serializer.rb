class SubscriptionSerializer < ActiveModel::Serializer
  attributes :tea_id, :customer_id, :active

  def self.render(subscription)
    {
      data:
          {
            id: subscription.id,
            type: 'subscription',
            attributes: {
              tea_id: subscription.tea_id,
              customer_id: subscription.customer_id,
              active: subscription.active,
            }
          }
    }.to_json
  end
end
