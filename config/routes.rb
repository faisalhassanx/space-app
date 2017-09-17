Rails.application.routes.draw do

  get '/contact' => 'static_pages#contact'
  get '/home' => 'static_pages#home'
  get '/about' => 'static_pages#about'

  root "static_pages#home"
  
end
