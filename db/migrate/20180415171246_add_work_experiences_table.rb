class AddWorkExperiencesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :work_experiences do |t|
      t.date :start_at, null: false
      t.date :end_at
      t.string :company, null: false
      t.string :position, null: false
      t.string :description, null: false
      t.references :admin, null: false
      t.timestamps
    end
  end
end
