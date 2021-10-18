Rails.application.routes.draw do
  resources :videos, only: [:index, :create, :show]
  resources :categories, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
