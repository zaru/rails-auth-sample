Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user do
    resources :registrations, only: [:new, :create]
  end
end
