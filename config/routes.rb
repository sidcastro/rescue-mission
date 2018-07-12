Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end

  resources :answers, only: [:show]

  root 'questions#index'
  devise_for :users
end
