Rails.application.routes.draw do
  get 'events/new'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  # イベントページ
  get 'event_signup', to: 'events#event_signup'
  post 'event_new', to: 'events#create'
  delete '/destroy', to: 'events#destroy'
  
  resources :users
end
