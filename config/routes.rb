Rails.application.routes.draw do

  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # get    '/circle/:id/micropost/new' => 'microposts#new'
  # post   '/circle/:id/micropost/create' => 'microposts#create'
  resources :users
  resources :circles do
    # member do
      get '/micropost/new', to: 'microposts#new'
      get '/micropost/:id', to: 'microposts#show', as: 'micropost'
      post 'micropost/create', to: 'microposts#create'
      get '/micropost/:id/edit', to: 'microposts#edit', as: 'micropost_edit'
      post '/micropost/:id/update', to: 'microposts#update'
      delete '/micropost/:id/destroy', to: 'microposts#destroy'
      # resources :microposts
    # end
  end
  # ``, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
