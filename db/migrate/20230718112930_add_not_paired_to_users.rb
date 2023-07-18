class AddNotPairedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :not_paired, :boolean, default: false
  end
end
