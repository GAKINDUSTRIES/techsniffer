Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations:  'api/v1/registrations',
    sessions:  'api/v1/sessions',
    passwords:  'api/v1/passwords'
  }

  get '/', to: 'home#index', as: :root
  resources :messages, only: :create

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      devise_scope :user do
        get :status, to: 'api#status'
        resources :users, only: :show
        resource :user, only: :update do
          get :profile
        end
      end
    end
  end
end
