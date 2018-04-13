module AdminRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :first_name
        field :last_name
        field :email
        field :created_at do
          label 'member since'
        end
        field :updated_at
      end

      edit do
        field :first_name
        field :last_name
        field :username
        field :email
        field :website
        field :password
        field :avatar
        field :bio
        field :projects_completed
        field :happy_clients
        field :phone
        field :address
        field :city
        field :zipcode
        field :country_code
      end
    end
  end
end
