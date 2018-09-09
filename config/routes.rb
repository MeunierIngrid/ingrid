Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'quizz-informations', to: 'pages#survey', as: 'quizz_informations'

  resources :surveys, only: [:new, :create, :show]
  resources :books, only: [:index, :show] do
    resources :orders, only: [:show, :create], shallow: true
  end
end
