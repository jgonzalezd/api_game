class AddUniqueIndexToGameValidWord < ActiveRecord::Migration[5.1]
  def change
    add_index :game_valid_words, [:game_id, :valid_word_id], unique: true
  end
end
