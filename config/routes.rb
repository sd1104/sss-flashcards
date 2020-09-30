Rails.application.routes.draw do
  root to: 'home#index'
  resources :genre, only: :index
  resources :words, only: :index
  namespace :api do
    namespace :v1 do
      resources :words, only: :index
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
