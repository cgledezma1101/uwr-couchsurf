Rails.application.routes.draw do
  get 'couches/create'

  get 'couches/destroy'

  get 'hosts/index'

  get 'hosts/create'

  get 'hosts/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :host, only: [:index, :create, :destroy]
  resources :couch, only: [:create, :destroy]
end
