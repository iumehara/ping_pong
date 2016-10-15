class Player < ApplicationRecord
  belongs_to :tournament
  has_one :team
end
