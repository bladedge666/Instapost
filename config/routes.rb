Rails.application.routes.draw do
  devise_for :users
  get 'about' => "static#about"
  root 'posts#index'
  resources :posts do
    resources :comments
  end

  resources :users, only: :show # for users_controller 

end
