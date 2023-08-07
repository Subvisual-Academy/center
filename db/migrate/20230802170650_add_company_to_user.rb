class AddCompanyToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :company, foreign_key: true

    User.update_all(company_id: 1)

    change_column_null :users, :company_id, false
  end
end
