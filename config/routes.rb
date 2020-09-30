Rails.application.routes.draw do
  get 'cards/index'
  get 'cards/show'
  get 'genre/index'
  get 'genre/show'
  root to: 'home#index'
  resources :genre, only: :show
  resources :cards, only: :show
  namespace :api do
    namespace :v1 do
      resources :words, only: :index
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
