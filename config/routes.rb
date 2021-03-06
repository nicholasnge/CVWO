Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get 'todos/index'
      post 'todos/create'
      patch 'todos/update/:id', to: 'todos#update'
      get '/show/:id', to: 'todos#show'
      delete '/destroy/:id', to: 'todos#destroy'
    end
  end
  root 'homepage#index'
  get '/*path' => 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
