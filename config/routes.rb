Rails.application.routes.draw do

  resources :words
  resources :users
  resources :sessions

  get "/words/search" => "words#search"                                           #Note: Need this 'get' function, or else it will cause an error. The 'get' function has to be written before the 'words' route to avoid clashes with "words#show" due to the same url pattern
  post "/words/search" => "words#search", as: "search" 

  root "words#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
