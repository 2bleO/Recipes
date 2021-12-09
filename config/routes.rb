Rails.application.routes.draw do
  devise_for :users
  root 'foods#index'
  resources :recipe_foods
  resources :foods, only: %i[index create destroy]
  resources :recipes, only: %i[index show create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
