Rails.application.routes.draw do


  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :collaborators, only: [:new, :create]

  get 'unsub' => 'charges#unsub'

  get 'user/name'

  get 'user/email'

  get 'about' => 'welcome#about'

  get 'new' => 'wikis#new'

  root 'welcome#index'
end
