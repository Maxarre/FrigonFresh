Rails.application.routes.draw do
  # get 'bookings/show'
  # get 'bookings/create'
  # get 'fridges/index'
  # get 'fridges/show'
  # get 'fridges/create'
  # get 'fridges/edit'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/dashboard'
  # GET "/users/:id/dashboard" to: "users#dashboard"
  # GET "/users/new" to: "users#new"
  # POST "/users" to: "users#create"
  # GET "/users/:id" to: "users#show"
  # GET "/users/:id/edit" to: "users#edit"
  # PATCH "/users/:id" to: "users#update"
  # DELETE "users/:id" to: "users#destroy"
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [:index, :show] do
    resources :fridges do
      resources :bookings, except: [:index, :edit, :update]
    end
  end
  resources :fridges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
