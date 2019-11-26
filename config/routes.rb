Rails.application.routes.draw do
  get 'search/index'
  get 'search/search'
  get 'prefecture/index'
  post 'prefecture/show'
  get 'prefecture/show'
  get 'likes/create'
  get 'likes/destroy'
  get 'favorite/fav'
  get 'accounts/index'
  get 'accounts/mylist'
  root 'events#index'
  get 'comments/index'
  get 'prefecture/test'
  get 'search/select'
  devise_for :users


  resources :images do
	collection do
		get 'input'
		get 'select'
	end
  end
  resources :events do
	resources :likes, only: [:create, :destroy]
	resources :genres, only: [:create, :destroy]
  end
  resources :event_performers do
	collection do
		get 'input'
		get 'select'
	end
  end

  resources :genres do
	collection do
		get 'input'
		get 'select'
	end
  end

  resources :prefecture do
  end
  get 'prefecture/index'
  get 'today/select'

  get 'edit_event/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
