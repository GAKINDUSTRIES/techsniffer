class RemoveRecommendationIdColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :recommendations, :recommendation_id
  end
end
