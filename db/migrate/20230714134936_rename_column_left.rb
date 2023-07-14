class RenameColumnLeft < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :left, :not_paired
  end
end
