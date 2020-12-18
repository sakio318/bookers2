Rails.application.routes.draw do
  get "home/about" => "homes#show"
  devise_for :users

  root to: 'homes#top'
  resources :books, only:[:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only:[:index, :show, :edit, :update]do
    member do
      get :followed, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
end
