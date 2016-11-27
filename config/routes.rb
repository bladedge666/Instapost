Rails.application.routes.draw do
  get 'about' => "static#about"
  root 'posts#index'
  resources :posts do
    resources :comments
  end

  resources :users, only: :show # for users_controller 

  devise_for :users
end
