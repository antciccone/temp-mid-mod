Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index, :create, :update, :edit]
  resources :users, only: [:index, :new, :create]

  get '/', to: redirect('/login')
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  namespace :api do
    namespace :v1 do
      namespace :links do
        get '/top-ten', to: 'top#index'
      end
        resources :links, only: [:update, :index]
    end
  end
end
