Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'customers#index'

  resources :customers do
    resources :bookings do
      resources :booked_pets, only: %i[create destroy]
    end
    resources :pets
  end
end
