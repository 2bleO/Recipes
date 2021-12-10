Rails.application.routes.draw do
  devise_for :users
  root 'foods#index', as: 'home'
  resources :users, only: %i[index show] do
    resources :foods
    resources :shopping_lists, only: %i[index show]
    resources :recipe_foods
    resources :recipes do
      resources :recipe_foods
    end
  end
  get 'public_recipes', to: 'recipes#public_recipes'
end
