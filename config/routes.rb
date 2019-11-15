Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'favorite/fav'
  get 'accounts/index'
  root 'today#index'
  get 'comments/index'
  devise_for :users
  resources :images do
	collection do
		get 'input'
	end
  end
  resources :events do
	resources :likes, only: [:create, :destroy]
  end
  resources :event_performers do
	collection do
		get 'input'
	end
  end
	
  get 'today/index'
  get 'today/select'
  get 'input_performer/index'
  get 'input_performer/show' => 'input_performer/show#show'
  get 'input_performer/new'

  get 'edit_event/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
