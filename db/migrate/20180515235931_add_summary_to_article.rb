class AddSummaryToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :summary, :string, null: false
  end
end
