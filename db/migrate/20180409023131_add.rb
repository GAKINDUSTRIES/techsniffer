class Add < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :page_header, null: false
      t.string :slug, null: false, index: true
      t.string :body
      t.boolean :published, default: false
      t.string :tags, array: true, default: []
      t.boolean :comments_permitted, default: true
      t.references :category
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
