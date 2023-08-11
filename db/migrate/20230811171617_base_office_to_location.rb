class BaseOfficeToLocation < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :base_office, :location
    change_column :users, :location, :string
  end
end
