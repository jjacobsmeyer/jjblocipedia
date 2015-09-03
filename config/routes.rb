Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  devise_for :users
  resources :users, only: [] do
    collection do
      put "downgrade"
    end
  end
  root to: 'welcome#index'
end
