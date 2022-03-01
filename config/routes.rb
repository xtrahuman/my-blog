Rails.application.routes.draw do
  devise_for :user
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index create new show]
  end
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  root to: "users#index"
end


