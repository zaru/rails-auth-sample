Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "pages#index"
  get "sign_in" => "user/sessions#new"
  delete "sign_out" => "user/sessions#destroy"
  namespace :user do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: :create
  end
end
