# frozen_string_literal: true

class AddEmailToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :email, :string
  end
end
