Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get '/about' => 'homes#about'
   resources :users
  resources :books do 
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
