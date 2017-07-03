Rails.application.routes.draw do


  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]

  get 'unsub' => 'charges#unsub'

  get 'user/name'

  get 'user/email'

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
