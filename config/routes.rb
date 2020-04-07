Rails.application.routes.draw do
	
  devise_for :users
  root to:'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :books do
 	resource :book_comments,only:[:create,:destroy]
 end
  post   '/like/:book_id' => 'likes#like',   as: 'like'
  delete '/like/:book_id' => 'likes#unlike', as: 'unlike'
 resources :users do
 	get 'followindex'
    get 'followerindex'
end

 resources :homes
 resources :relationships, only: [:create,:destroy]

 post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す


 get 'home/about'=>'home#about'
end
