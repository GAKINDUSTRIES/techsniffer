class AddRecommenderPositionAndRoleToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :recommender_role, :string
    add_column :recommendations, :recommender_company, :string
  end
end
