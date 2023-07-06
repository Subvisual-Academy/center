class ChangeLocationName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :location, :base_office
  end
end
