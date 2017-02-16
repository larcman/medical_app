Rails.application.routes.draw do
  root 'centers#index'
  
  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'centers' => 'centers#index'
  get 'centers/index'
  get 'centers/:id' => 'centers#show', as: 'center'
  resources :centers
  
  get 'users' => 'users#index', as: 'users'
  get 'users/index'
  get 'users/new' => 'users#new', as: 'new_user'
  get 'users/:id/edit' => 'users#edit'
  put 'users/:id/edit' => 'users#edit', as: 'edit_user'
  post 'users/update'
  delete 'users/:id' => 'users#destroy'
  resources :users
  
  get 'researches' => 'researches#index', as: 'researches'
  get 'researches/index'
  get 'researches/new' => 'researches#index'  
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
  post 'people/update'
  delete 'people/:id' => 'people#destroy'  
  resources :people
  
  get 'patients/new' => 'patients#new', as: 'new_patient'
  get 'patients/:id' => 'patients#show', as: 'patient'  
  get 'patients/:id/edit' => 'patients#edit'
  put 'patients/:id/edit' => 'patients#edit', as: 'edit_patient'
  post 'patients/update'
  delete 'patients/:id' => 'patients#destroy'
  resources :patients
  
  get 'appointments/new' => 'appointments#new', as: 'new_appointment'
  get 'appointments/:id' => 'appointments#show', as: 'appointment'  
  get 'appointments/:id/edit' => 'appointments#edit'
  put 'appointments/:id/edit' => 'appointments#edit', as: 'edit_appointment'
  post 'appointments/update'
  delete 'appointments/:id' => 'appointments#destroy'
  resources :appointments
  
end
