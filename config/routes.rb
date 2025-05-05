Rails.application.routes.draw do
  root :to => 'homes#top'
  # root :toは先頭にする
  get 'rooms/own'
  get 'users/account'
  get 'users/profile'
  get 'homes/top'
  get 'homes/tokyo'
  get 'homes/kyoto'
  get 'homes/osaka'
  get 'homes/sapporo'
  get 'homes/area_search'

  #get 'homes/area/:name', to: 'homes#area', as: 'area_home'
  #これで /homes/area/tokyo や /homes/area/kyoto のようにアクセス可能です。params[:name] でエリア名をコントローラーに渡せるかと思いました
  
  devise_for :users
  resources :users

  resources :rooms do
    collection do
      get 'search'
    end
  end

  resources :reservations, only: [:create, :index] do
    collection do
      post 'confirmation', to: 'reservations#confirmation'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
