Rails.application.routes.draw do

  get 'books/index'
  get 'books/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'quizz-informations', to: 'pages#survey', as: 'quizz_informations'

  resources :surveys, only: [:new, :create, :show]
  resources :books, only: [:index, :show]
end
