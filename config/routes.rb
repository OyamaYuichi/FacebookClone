Rails.application.routes.draw do
  devise_for :users
  root to: 'feeds#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show]

  resources :feeds do
    collection do
      post :confirm
    end
  end
end
