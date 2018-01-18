Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do   #コントローラーごとに設定
    resources :comments,only: [:create]
    #  post 'tweets/:tweet_id/comment' => 'comments#create'
  end
  resources :users,only: [:show]
  #     get 'tweets' => 'tweets#index'
  #     get 'tweets/new' => 'tweets#new'
  #     post 'tweets' => 'tweets#create'
  # get 'users/:id' => 'users#show'

  # delete 'tweets/:id' => 'tweets#destroy'
  # get 'tweets/:id/edit' => 'tweets#edit'
  # get 'tweets/:id' => 'tweets#update'
  # get 'tweets/:id' => 'tweets#show'
end
