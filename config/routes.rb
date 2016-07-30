Rails.application.routes.draw do
	root to: "hosts#index"

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :hosts, only: [:index, :create, :destroy]
	resources :couches, only: [:create, :destroy] do
		put 'occupy', on: :member
		put 'vacate', on: :member
		patch 'update_details', on: :member
	end
end
