Rails.application.routes.draw do





	root 'home#top'
	get 'home/about'
	get 'search' => 'search#search'

	 devise_for :users
	 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	 resources :users do
	 	resource :relationships, only: [:create, :destroy]
	 	get :follows, on: :member #resource以外のルーティングを設定したい場合にon: :memberを使用する。
	 	get :followers, on: :member #resource以外のルーティングを設定したい場合にon: :memberを使用する。
	 end

	 resources :books do
	 	resources :book_comments, only: [:create, :destroy]
	 	resource :favorites, only: [:create, :destroy]
	 end

end
