class CreateValidWords < ActiveRecord::Migration[5.1]
  def change
    create_table :valid_words do |t|
      t.text :word, null: false
    end
  end
end
