Rails.application.routes.draw do
  resources :contacts
  # If we don't want rails to create all the urls of a resource
  # We can specify the urls we want as below
  # get "/contacts", to: "contacts#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
