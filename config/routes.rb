Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, skip: %i[sessions registrations], controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    post 'users/sign_out',
         to: 'devise/sessions#destroy',
         as: :destroy_web_user_session
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations:  'api/v1/registrations',
    sessions:  'api/v1/sessions',
    passwords:  'api/v1/passwords'
  }

  get '/', to: 'home#index', as: :root
  resources :messages, only: :create
  resources :articles, only: %i[index show], param: :slug do
    resources :comments, only: :create, module: :articles
  end

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

  match '*path' => 'application#error_404', via: :all
end
