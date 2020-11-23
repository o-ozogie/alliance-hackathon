class Spot < ApplicationRecord
  has_many :logs, foreign_key: :spots_id
end
