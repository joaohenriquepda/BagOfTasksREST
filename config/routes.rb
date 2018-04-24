require 'sidekiq/web'

Rails.application.routes.draw do
  resources :matrix_calculators
  mount Sidekiq::Web => '/sidekiq'
end