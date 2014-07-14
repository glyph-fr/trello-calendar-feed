Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Rich::Engine => '/rich', :as => 'rich'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: "home#index"

  resources :feeds, only: [:index]

  resources :organizations, only: [] do
    resource :feed, only: [:show]
  end

  resources :boards, only: [] do
    resource :feed, only: [:show]
  end
end
