class AddUniqueIndexToValidWord < ActiveRecord::Migration[5.1]
  def change
    add_index :valid_words, :word, :unique => true
  end
end
