Rails.application.routes.draw do



  get 'users/show'

  get 'likes/index'

  resources :topics

  resources :topics, only: [] do
    resources :bookmarks, except: [:index, :show]
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  root 'welcome#index'
  post :incoming, to: 'incoming#create'
  devise_for :users
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
