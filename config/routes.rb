Rails.application.routes.draw do



  resources :topics

  resources :topics, only: [] do
    resources :bookmarks, except: [:index, :show]
  end

  root 'welcome#index'
  post :incoming, to: 'incoming#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
