Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resource :writers, only: %i[edit update], module: 'articles'
  end

  resources :writers
end
