Rails.application.routes.draw do
  get 'user_stocks/create'
  get 'friends/create'
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_stocks', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
  get 'profile', to: 'users#profile'
  resources :user_stocks, only:[:create, :destroy]
  resources :friends, only:[:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
