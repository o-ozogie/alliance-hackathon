class Log < ApplicationRecord
  belongs_to :user, foreign_key: :user_email
  belongs_to :spot, foreign_key: :spots_id
end
