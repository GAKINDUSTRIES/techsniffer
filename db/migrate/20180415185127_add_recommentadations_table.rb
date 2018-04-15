class AddRecommentadationsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.string :message
      t.string :recommendation_text
      t.string :recommender_name
      t.integer :relationship
      t.string :subject
      t.integer :recommendation_id, null: false, index: true
      t.references :admin, null: false
      t.timestamps
    end
  end
end
