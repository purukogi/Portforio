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
  get 'event_edit', to: 'events#event_edit'
  patch 'event_update', to: 'events#event_update'
  
  # プライベートボックスページ
  
  resources :users do
    member do 
      get 'pbox_index'
      get 'pbox_new', to: 'pboxes#new'
      post 'pbox_create', to: 'pboxes#create'
      delete 'pbox_delete', to: 'pboxes#destroy'
    end
  end
end
