Rails.application.routes.draw do

  root to: "links#index"

  resources :links, only: [:index, :create, :update, :edit, :destroy]
  resources :users, only: [:index, :new, :create]

  get '/', to: redirect('/login')
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :new, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create, :update]
    end
  end
end
