Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:show, :index]
  end
  root "users#index"
end
