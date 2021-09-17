Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/customers/:id/subscriptions', to: 'subscriptions#create'
      patch '/subscriptions/:id', to: 'subscriptions#update'
      get '/customers/:id/subscriptions', to: 'customers/subscriptions#index'
    end
  end
end
