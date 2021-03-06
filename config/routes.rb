Rails.application.routes.draw do
  get 'rooms/create'
  get "home/about" => "homes#show"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  root to: 'homes#top'
  get "search" => "searchs#_search"
  get "result" => "searchs#result"

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

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

end
