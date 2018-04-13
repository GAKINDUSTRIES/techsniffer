class AddDeviseToAdmins < ActiveRecord::Migration[5.1]
  def self.up
    create_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :website, null: false
      t.string :avatar, null: false
      t.string :bio, null: false
      t.integer :projects_completed, null: false
      t.integer :happy_clients, null: false
      t.string :phone, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :zipcode, null: false
      t.string :country_code, null: false
      t.timestamps
    end

    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true
    # add_index :admins, :confirmation_token,   unique: true
    # add_index :admins, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
