class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      #Primary keys in Rails 5.1 are now big integers by default!
      #https://github.com/rails/rails/pull/26266
      t.text    :board
      t.integer :score, default: 0
      t.timestamps
    end
  end
end
