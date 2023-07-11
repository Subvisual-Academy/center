class ChangeUserEmailPassNnull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
    change_column_null :users, :password_digest, false
  end
end
