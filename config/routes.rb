Rails.application.routes.draw do

  #rails routesで一覧見れる
  #アドレスに入れる奴 to:コントローラー名#メソッド名

  #ルート、その日のイベント
  root 'events#index'
  devise_for :users



  #検索用
  get 'search', to:'search#index'
  post 'search', to:'search#search'
  get 'search/select' #カレンダークリック


  #アカウント関連
  get 'accounts', to:'accounts#index'
  get 'mylist', to:'accounts#mylist'

  #ここまで済


  resources :images do
	collection do
		get 'input'
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
  get 'today/select'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
