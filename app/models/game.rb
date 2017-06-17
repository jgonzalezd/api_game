class Game < ApplicationRecord
  include Dice

  serialize :board, Array

  # attr_reader scores

  # has_and_belongs_to_many :words, class_name: 'ValidWord'
  has_many :game_valid_words
  has_many :valid_words, through: :game_valid_words

  before_create :generate_board

  validates_with GameValidator

  private

  def generate_board
    self.board = Dice.shake.each_slice(5).to_a
  end
end
