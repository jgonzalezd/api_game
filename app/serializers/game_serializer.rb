class GameSerializer < ActiveModel::Serializer
  has_many :valid_words, serializer: ValidWordSerializer, key: :words
  attributes :id, :board, :score

  def board
    object.board.map { |row| row.join('').upcase  }
  end

  def score
    object.valid_words.inject(0) do |memo, vw|
      word_size = vw.word.size
      word_size = word_size <= 8 ? word_size : 8
      memo += SCORES['word_size'][word_size]
    end
  end
end
