class AddCompanyToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :company, foreign_key: true

    execute "INSERT INTO companies (name, created_at, updated_at) VALUES ('Subvisual', NOW(), NOW())"
    execute "UPDATE users SET company_id = (select id from companies limit 1);"

    change_column_null :users, :company_id, false
  end
end
