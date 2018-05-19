class AddMessageTable < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject
      t.string :message, null: false
      t.references :admin

      t.timestamps null: false
    end
  end
end
