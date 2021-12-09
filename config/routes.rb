Rails.application.routes.draw do
  devise_for :users
  root 'foods#index', as: 'home'
  resources :users, only: %i[index show] do 
    resources :foods
    resources :inventories
    resources :shopping_list
    resources :recipe_foods
    resources :recipes do
      resources :recipe_foods
    end
  end
end
