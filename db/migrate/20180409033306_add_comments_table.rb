class AddCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :website
      t.string :message, null: false
      t.references :article, null: false
    end
  end
end
