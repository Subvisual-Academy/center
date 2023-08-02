class CreateHobbies < ActiveRecord::Migration[7.0]
  def change
    create_table :hobbies do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
