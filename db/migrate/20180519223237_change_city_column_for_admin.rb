class ChangeCityColumnForAdmin < ActiveRecord::Migration[5.1]
  def change
    rename_column :admins, :city, :city_code
    add_column :admins, :neighborhood, :string
  end
end
