Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'newreview', to: 'reviews#new'
  get 'newmovie', to: 'movies#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following,:followers
    end
  end
  
  resources :movies
  
  resources :reviews
  
  resources :sessions, only: [:new,:create,:destroy]

  resources :relationships, only: [:create, :destroy]
  
  resources :moviethreads
  
end
