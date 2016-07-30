Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :host, only: [:index, :create]
  resources :couch, only: [:create, :destroy]
end
