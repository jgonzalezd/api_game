class Game < ApplicationRecord
  include Dice

  serialize :board, Array

  # has_and_belongs_to_many :words, class_name: 'ValidWord'
  has_many :game_valid_words
  has_many :valid_words, through: :game_valid_words

  before_create :generate_board

  validates_with GameValidator
end
