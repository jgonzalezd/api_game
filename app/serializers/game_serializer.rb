class GameSerializer < ActiveModel::Serializer
  attributes :id, :board, :score
  attribute  :valid_words, key: :words
end
