Rails.application.routes.draw do
  root 'centers#index'
  get 'centers' => 'centers#index'
  get 'centers/:id' => 'centers#show', as: :center

  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'users' => 'users#index'
  get 'users/index'
  get 'users/show'
  delete 'users/:id' => 'users#destroy'
  get 'signup'  => 'users#new'
  resources :users

end
