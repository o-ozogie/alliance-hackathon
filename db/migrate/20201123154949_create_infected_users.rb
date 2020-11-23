class CreateInfectedUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :infected_users do |t|
      t.datetime :infected_at
      t.string :user_email
    end
  end
end
