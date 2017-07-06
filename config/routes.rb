Rails.application.routes.draw do


  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :wikis, only: [] do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  get 'unsub' => 'charges#unsub'

  get 'user/name'

  get 'user/email'

  get 'about' => 'welcome#about'

  get 'new' => 'wikis#new'

  root 'welcome#index'
end
