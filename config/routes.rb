Rails.application.routes.draw do
  resources :writers
  root 'articles#index'

  resources :articles
end
