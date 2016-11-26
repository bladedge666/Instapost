Rails.application.routes.draw do
  get 'about' => "static#about"
  root 'posts#index'
  resources :posts
  
  devise_for :users
end
