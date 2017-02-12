Rails.application.routes.draw do
  root 'centers#index'
  get 'centers' => 'centers#index'
  get 'centers/:id' => 'centers#show', as: :center

  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  # DELETE ME
  get 'signup'  => 'users#new'
  resources :users

end
