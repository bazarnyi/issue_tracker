Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'issues#index'
  resources :issues, only: [:new, :show, :edit, :destroy]
end
