Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :users, only: [:new, :create, :show]
end
