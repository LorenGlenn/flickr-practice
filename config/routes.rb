Rails.application.routes.draw do
  devise_for :users
  resources :users, :only=> [] do
    resources :posts
  end

  resources :posts, :only=> [] do
    resources :tags, only: [:create, :destroy, :new]
  end

  post '/', to: 'posts#search', as: 'search'

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
