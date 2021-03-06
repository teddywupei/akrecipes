Recipes::Application.routes.draw do
  resources :users do
    resources :recipes
    member do
      get 'delete'
    end
  end
  match 'signup' => 'users#new', via: :get
  match 'account' => 'users#show', via: :get

  resources :sessions
  match 'login' => 'sessions#new', via: :get, as: :login
  match 'logout' => 'sessions#destroy', via: :get, as: :logout


  resource :pages
  match 'about' => 'pages#about', via: :get

  resources :images

  resources :recipes do
    member do
      get 'delete'
    end
  end
  match 'most_recent' => 'recipes#most_recent', via: :get

  root to: 'recipes#index'
end
