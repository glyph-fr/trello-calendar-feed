Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: "home#index"

  resources :feeds, only: [:index]

  resources :organizations, only: [] do
    resource :feed, only: [:show]
    resources :boards, only: [:index]
  end

  resources :boards, only: [] do
    resource :feed, only: [:show]
  end
end
