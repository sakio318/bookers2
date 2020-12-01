Rails.application.routes.draw do
  get 'users/show'
  get "abort" => "homes#show"
  devise_for :users

  root to: 'homes#top'
  resources :books, only:[:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only:[:index, :show, :edit, :update]
end
