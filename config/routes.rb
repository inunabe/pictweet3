Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets #コントローラーごとに設定
  #     get 'tweets' => 'tweets#index'
  #     get 'tweets/new' => 'tweets#new'
  #     post 'tweets' => 'tweets#create'
  get 'users/:id' => 'users#show'
end
