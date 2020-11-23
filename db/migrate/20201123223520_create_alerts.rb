class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.string :user_email
      t.references :log, index: true
    end
  end
end
