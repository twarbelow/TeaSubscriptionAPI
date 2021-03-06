# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/customers', to: 'customers#create'
      post '/customers/:id/subscriptions', to: 'customers/subscriptions#create'
      get '/customers/:id/subscriptions', to: 'customers/subscriptions#index'

      patch '/subscriptions/:id', to: 'subscriptions#update'
    end
  end
end
