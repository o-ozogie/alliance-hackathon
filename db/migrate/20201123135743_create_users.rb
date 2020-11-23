class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, primary_key: :email do |t|
      t.string :password, null: false
      t.string :name
      t.date :birth_date
      t.string :address
      t.string :string
      t.string :blood_type
    end
    change_column :users, :email, :string
  end
end
