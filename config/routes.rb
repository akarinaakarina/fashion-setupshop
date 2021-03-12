Rails.application.routes.draw do
  get 'original_items/index'
  devise_for :users
  root to: "original_items#index"
  resources :original_items do
    resources :buys, only: [:create, :index]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
