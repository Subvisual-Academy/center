class AddDefaultToUsersLeft < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :left, from: nil, to: false
  end
end
