class GameValidWord < ApplicationRecord
  belongs_to :game
  belongs_to :valid_word
  validates_with GameValidator

end
