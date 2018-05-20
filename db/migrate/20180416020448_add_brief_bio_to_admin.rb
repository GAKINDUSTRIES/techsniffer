class AddBriefBioToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :brief_bio, :string, null: false
    rename_column :admins, :bio, :extended_bio
  end
end
