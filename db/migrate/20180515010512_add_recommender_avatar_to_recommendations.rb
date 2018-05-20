class AddRecommenderAvatarToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :recommender_avatar, :string
  end
end
