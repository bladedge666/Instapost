Rails.application.routes.draw do
  get 'about' => "static#about"
  root 'posts#index'

  devise_for :users
end
