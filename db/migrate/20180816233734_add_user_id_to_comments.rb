class AddUserIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, null: false
    remove_column :comments, :website
    remove_column :comments, :email
    remove_column :comments, :name
    add_column :comments, :created_at, :datetime, null: false
    add_column :comments, :updated_at, :datetime, null: false
  end
end
