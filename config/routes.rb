Rails.application.routes.draw do
  resources :events
  resources :evenps
  resources :event_performers do
	collection do
		get 'input'
	end
  end
	
  get 'today/index'
  get 'input_performer/index'
  get 'input_performer/show' => 'input_performer/show#show'
  get 'input_performer/new'
  resources :users
  root 'today#index'

  get 'edit_event/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
