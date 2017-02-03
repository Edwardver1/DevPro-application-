Rails.application.routes.draw do
  get 'assigns/new'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get  '/home',    to: 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  delete '/delete_developerAssign',  to: 'assigns#delete_developerAssign'
  get '/delete_developerAssign',  to: 'assigns#delete_developerAssign'


  resources :users
  resources :developers
  resources :projects
  resources :assigns

end