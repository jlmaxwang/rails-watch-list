Rails.application.routes.draw do
  root to: 'lists#index'
  resources :movies, only: [:index, :show, :new, :create]
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy] do
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
