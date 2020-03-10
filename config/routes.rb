Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update, :new, :create]
  resources :books do
  	resources :book_comments, only: [:create, :destroy, :edit, :update]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  root "homes#top"
  get 'home/about' => 'homes#about'
end
