class CreateGamesAndValidWords < ActiveRecord::Migration[5.1]
  def change
    create_table :game_valid_words do |t|
      t.belongs_to :game,        index: true
      t.belongs_to :valid_word,  index: true
    end
  end
end
