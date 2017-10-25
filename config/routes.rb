Rails.application.routes.draw do

  # get 'bookmarks/index'
  #
  # get 'bookmarks/new'
  #
  # get 'bookmarks/edit'
  #
  # get 'bookmarks/create'

  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  resources :topics

  resources :topics do
    resources :bookmarks
  end

  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
