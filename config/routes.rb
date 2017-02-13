Rails.application.routes.draw do
  root 'centers#index'
  get 'centers' => 'centers#index'
  get 'centers/index'
  get 'centers/:id' => 'centers#show', as: 'center'
  resources :centers

  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'users' => 'users#index'
  get 'users/index'
  get 'users/new'
  post 'users/update'
  put 'users/:id' => 'users#show'
  delete 'users/:id' => 'users#destroy'
  resources :users

  get 'researches' => 'researches#index', as: 'all_researches'
  get 'researches/index'
  get 'researches/:id' => 'researches#show', as: 'research'
  put 'researches/:id' => 'researches#edit', as: 'edit_research'
  resources :researches

end
