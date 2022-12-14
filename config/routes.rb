Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :organizations do
    resources :events
  end
  resources :bookings, only: [] do
    resources :reviews, only: %i[new create]
  end
  resources :events do
    resources :bookings, only: %i[new create]
  end
  resources :events, only: [:index]
  resources :profiles, only: [:show] do
    resources :messages, only: [:index, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
