Rails.application.routes.draw do
  get 'quizzes/new'
  get 'quizzes/create'
  get 'quizzes/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'quizz', to: 'pages#quizz'

  resources :quizzes, only: [:new, :create, :show]
end
