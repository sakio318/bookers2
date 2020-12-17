Rails.application.routes.draw do
  get "home/about" => "homes#show"
  devise_for :users

  root to: 'homes#top'
  resources :books, only:[:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update]
end
