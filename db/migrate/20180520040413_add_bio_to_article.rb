class AddBioToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :bio, :text
  end
end
