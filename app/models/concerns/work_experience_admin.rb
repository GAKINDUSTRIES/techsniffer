module WorkExperienceAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      configure :description, :text do
        html_attributes rows: 20, cols: 50
      end

      list do
        field :company
        field :position
        field :start_at
        field :end_at
      end
    end
  end
end
