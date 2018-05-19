class AddPublishedAtIndexToArticles < ActiveRecord::Migration[5.1]
  def change
    add_index :articles, :published_at
  end
end
