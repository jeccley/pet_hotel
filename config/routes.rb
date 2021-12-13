Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'customers#index'

  resources :bookings do
    resources :pets
  end

  resources :customers do
    resources :bookings
  end
end
