Rails.application.routes.draw do
  root "projects#index"
  devise_for :users

  resources :projects do
    resources :comments, only: [ :create ]
  end
end
