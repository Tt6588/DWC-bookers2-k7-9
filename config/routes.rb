Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  get '/home/about', to:'homes#index'
  
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    # ↓いいね機能
    resource :favorites, only: [:create, :destroy]
    
    # ↓コメント機能
    resources :book_comments, only:[:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update,] do
    # ↓フォロー・フォロワー機能
    resource :relation_ships, only: [:create, :destroy]
    get 'followings' => 'relation_ships#followings'
    get 'followers' => 'relation_ships#followers'
  end
  
  get '/search', to:'searches#search'
  
  
end
