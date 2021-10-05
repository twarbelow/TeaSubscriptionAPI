class CustomerSerializer < ActiveModel::Serializer
  attributes :name, :email

  def self.render(customer)
    {
      data:
          {
            id: customer.id,
            type: 'customer',
            attributes: {
              name: customer.name,
              email: customer.email
            }
          }
    }.to_json
  end
end
