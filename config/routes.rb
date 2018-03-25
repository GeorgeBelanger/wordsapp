Rails.application.routes.draw do

  resources :words
  resources :users
  resources :sessions

  get "/words/search" => "words#search"                                           #Note: Need this 'get' function, or else it will cause an error. The 'get' function has to be written before the 'words' route to avoid clashes with "words#show" due to the same url pattern
  post "/words/search" => "words#search", as: "search"
  get "/sign_in" => "sessions#new", as: "sign_in" 

  root "words#index"

  match 'auth/:provider/callback', to: 'sessions#create_from_omniauth', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
