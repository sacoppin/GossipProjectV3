
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root 'home#show'
  get 'welcome(/:name)', to: 'welcome#show'
  get 'team', to: 'team#show'
  get 'contact', to: 'contact#show'
  resources :gossips
  resources :users #, only (:new :create)
  resources :cities
  resources :sessions
end