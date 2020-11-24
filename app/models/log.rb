class Log < ApplicationRecord
  belongs_to :user, foreign_key: :user_email
  belongs_to :spot, foreign_key: :spots_id

  def created_at
    super.strftime('%Y-%m-%d %H:%M:%S')
  end
end