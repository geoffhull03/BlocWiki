Rails.application.routes.draw do
  get 'user/name'

  get 'user/email'

  devise_for :users
  get "welcome/index"

  get "welcome/about"

  root 'welcome#index'
end
