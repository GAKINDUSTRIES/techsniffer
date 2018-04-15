class AddSkillsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :percentage, null: false
      t.references :admin, null: false
      t.timestamps
    end
  end
end
