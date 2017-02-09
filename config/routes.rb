Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # SOME EXAMPLES
  # root 'albums#index'
  # get 'albums' => 'albums#index'
  # get 'albums/new' => 'albums#new'
  # get 'albums/:id' => 'albums#show', as: :album
  # post 'albums' => 'albums#create'
  
  root 'sessions#new'
  # get 'signup'  => 'users#new'
  # resources :users
  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'  
end
