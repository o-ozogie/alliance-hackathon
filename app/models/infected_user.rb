class InfectedUser < ApplicationRecord
  belongs_to :user, foreign_key: :user_email
end
