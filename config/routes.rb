Rails.application.routes.draw do
  get 'reservations/index'
  get 'users/account'
  get 'users/profile'
  get 'homes/top'
  get 'homes/tokyo'
  get 'homes/kyoto'
  get 'homes/osaka'
  get 'homes/sapporo'
  get 'homes/area_search'

  devise_for :users
  resources :users
  resources :reservations

  resources :rooms do
    collection do
      get 'search'
    end
  end
  post 'reservations/confirmation', to: 'reservations#confirmation', as: :reservations_confirmation
  root :to => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
