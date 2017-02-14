Rails.application.routes.draw do
  root 'centers#index'
  
  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'centers' => 'centers#index'
  get 'centers/index'
  get 'centers/:id' => 'centers#show', as: 'center'
  resources :centers
  
  get 'users' => 'users#index'
  get 'users/index'
  get 'users/new'
  post 'users/update'
  put 'users/:id' => 'users#show'
  delete 'users/:id' => 'users#destroy'
  resources :users
  
  get 'researches' => 'researches#index', as: 'researches'
  get 'researches/index'
  get 'researches/:id' => 'researches#show', as: 'research'
  get 'researches/:id/edit' => 'researches#edit'
  put 'researches/:id/edit' => 'researches#edit', as: 'edit_research'
  post 'researches/update'
  resources :researches
  
  get 'people' => 'people#index', as: 'people'
  get 'people/index'
  get 'people/new' => 'people#new', as: 'new_person'
  get 'people/:id/edit' => 'people#edit'
  put 'people/:id/edit' => 'people#edit', as: 'edit_person'
  delete 'people/:id' => 'people#destroy'  
  resources :people
  
  get 'patients/new' => 'patients#new', as: 'new_patient'
  resources :patients
  
end
