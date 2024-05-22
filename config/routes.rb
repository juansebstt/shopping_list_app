Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "products#index"
  # config/routes.rb
# config/routes.rb

Rails.application.routes.draw do
  resources :products do
    member do
      patch :mark_as_purchased
    end
  end

  root "products#index"
end



end
