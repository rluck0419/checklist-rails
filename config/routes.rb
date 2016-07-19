Rails.application.routes.draw do
  resources :lists do
    resources :tasks
  end

  root 'tasks#index'
end
