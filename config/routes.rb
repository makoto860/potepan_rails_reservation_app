Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'
  get 'homes/top'
  devise_for :users
  resources :users
  root :to => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
