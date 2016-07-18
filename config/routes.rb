Rails.application.routes.draw do
  resources :tasks
  resources :lists

  root 'tasks#index'
end
