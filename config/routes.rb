Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]
  resources :users, only: [:index, :new, :create]

  get '/', to: redirect('/login')
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
