Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: 'pages#home'
  get '/biography', to: "pages#bio"
  get '/ressources', to: "pages#ressources"
  get 'quizz-informations', to: 'pages#survey', as: 'quizz_informations'
  get '/surveys/session', to: "surveys#update_session", as: 'session_survey'
  get '/mentions-legales', to: "pages#legal_notice", as: 'legal_notice'

  get 'orders/:id/download_pdf', to: "orders#download_pdf", as: 'download_pdf'

  resources :surveys, only: [:new, :create, :show]
  resources :books, only: [:index, :show] do
    resources :orders, only: [:show, :create], shallow: true
  end
  resources :contacts, only: [:new, :create]
end


