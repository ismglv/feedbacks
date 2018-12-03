# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'secret_path_admin_asdjadshkas', skip: :registrations
  devise_for :users, path: '/'

  root controller: :feedbacks, action: :new

  resources :feedbacks, only: %i[new create]

  namespace :admin do
    resources :feedbacks, only: :index
  end
end
