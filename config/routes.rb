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

  resources :collaborators, only: [:create, :destroy] do
    collection do
      delete "destroy", as: "destroy"
    end
  end

end
