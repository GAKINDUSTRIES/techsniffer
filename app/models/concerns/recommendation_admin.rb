module RecommendationAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      configure :recommendation_text do
        html_attributes rows: 20, cols: 50
      end

      list do
        field :recommender_name
        field :recommender_avatar do
          label 'Recommender avatar URL'
        end
        field :recommender_role
        field :recommender_company
        field :recommendation_text
        field :admin
      end

      edit do
        field :recommender_name
        field :recommender_avatar do
          label 'Recommender avatar URL'
        end
        field :recommender_role
        field :recommender_company
        field :recommendation_text
        field :admin
      end
    end
  end
end
