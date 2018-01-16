Rails.application.routes.draw do
  root 'tweets#index'
  resources :tweets #コントローラーごとに設定
  #     get 'tweets' => 'tweets#index'
  #     get 'tweets' => 'tweets#new'
  #     post 'tweets' => 'tweets#create'
end
