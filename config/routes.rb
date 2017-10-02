Rails.application.routes.draw do

  get    '/login'  => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  get '/signup'  => 'users#new'

  get '/help'    => 'static_pages#help'
  get '/contact' => 'static_pages#contact'
  get '/about'   => 'static_pages#about'

  root "static_pages#home"
  
end
