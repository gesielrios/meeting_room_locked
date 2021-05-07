Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations',
    omniauth_callbacks: 'omni_auth'
  }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get 'forgot_password', to: 'devise/passwords#new'
    get 'reset_password', to: 'devise/passwords#edit'
  end
  
  root 'scheduler#index'
  
end
