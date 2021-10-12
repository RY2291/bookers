Rails.application.routes.draw do
  root to: 'homes#top'
  get "/search" => "searches#search"
  devise_for :users
  get '/about' => 'homes#about'
   resources :users do
     resource :relationships, only: [:create, :destroy]
     get "following" => "users#following"
     get "follower" =>  "users#follower"
    end
  resources :books do 
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
