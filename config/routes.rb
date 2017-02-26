Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "pages#index"
  get "/secret" => "pages#secret"
  get "sign_in" => "user/sessions#new"
  delete "sign_out" => "user/sessions#destroy"
  namespace :user do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: :create
    resources :password_resets, onlye: [:new, :create, :edit, :update]
    get "mail_activate/:activate_code", controller: "mail_activate", action: "create", as: "mail_activate"
  end

  resources :users, only: :show

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
