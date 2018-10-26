Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  namespace :admin do
    resources :articles
  end

  root 'welcome#index'
  
end
