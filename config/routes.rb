Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: %i[index show destroy] do
    resources :posts, only: %i[index create new show destroy]
  end
  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: [:create]
  end

  root to: "users#index"
end


