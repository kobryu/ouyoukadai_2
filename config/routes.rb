Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'post_comments/create'
  get 'post_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to =>"homes#top"
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end



  resources :users, only: [:index,:show,:edit,:update] do
    
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加

  end

  get "home/about"=>"homes#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
