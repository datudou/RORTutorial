Rails.application.routes.draw do
  get 'sessions/new'

  get '/signup', to: 'users#new'

  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout' , to: 'sessions#destory'

  resources :microposts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'users#index'
end
