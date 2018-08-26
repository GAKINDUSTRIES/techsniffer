class ChangeBodyAndBioColumnType < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :hero_image
    rename_column :articles, :page_header, :hero_image
    remove_column :articles, :bio
    change_column :articles, :body, :text
  end
end
