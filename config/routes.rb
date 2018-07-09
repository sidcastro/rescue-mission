Rails.application.routes.draw do
  resources :questions

  root 'questions#index'
  devise_for :users
end
