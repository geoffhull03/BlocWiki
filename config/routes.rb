Rails.application.routes.draw do


  devise_for :users
  resources :wikis

  get 'user/name'

  get 'user/email'

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
