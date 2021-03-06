Rails.application.routes.draw do
  get 'events/new'
  root 'static_pages#top'
  
  # トップページ
  get '/signup', to: 'users#new'
  
  # SAについて
  get '/about', to: 'users#about'
  
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
    end
    resources :pboxes do
      member do
      end
    end
    resources :refrigerators do
      member do
      end
    end
  end
end
