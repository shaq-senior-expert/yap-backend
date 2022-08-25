Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do
  root "application#welcome"
  resources :reviews
  resources :businesses
  resources :users
  post "/login", to: "application#login"
  #   end
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/test", to: "application#test"
end
