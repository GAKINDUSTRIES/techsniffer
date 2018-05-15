class RemoveRecommendationIdmandatoryIndexOnRecommendations < ActiveRecord::Migration[5.1]
  def change
    change_column :recommendations, :recommendation_id, :integer, null: false
  end
end
