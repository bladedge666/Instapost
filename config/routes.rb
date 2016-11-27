Rails.application.routes.draw do
  get 'about' => "static#about"
  root 'posts#index'
  resources :posts do
    resources :comments
  end   
  devise_for :users
end
