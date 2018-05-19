module AdminRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      configure :brief_bio, :text do
        html_attributes rows: 20, cols: 50
      end

      configure :extended_bio, :text do
        html_attributes rows: 20, cols: 50
      end

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
        field :brief_bio
        field :extended_bio
        field :projects_completed
        field :happy_clients
        field :phone
        field :address
        field :neighborhood
        field :zipcode
        field :city_code
        field :country_code
      end
    end
  end
end
