class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.datetime :created_at
      t.references :spots, index: true
      t.string :user_email
    end
  end
end
