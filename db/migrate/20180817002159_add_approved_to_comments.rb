class AddApprovedToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :approved, :boolean, default: false, null: false
    add_index :comments, :approved
  end
end
