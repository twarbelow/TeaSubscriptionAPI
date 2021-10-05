# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
