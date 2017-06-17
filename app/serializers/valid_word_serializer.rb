class ValidWordSerializer < ActiveModel::Serializer
  attributes :word, :score
  def score
    size = object.word.size
    size = size <= 8 ? size : 8
    SCORES["word_size"][size]
  end
end
