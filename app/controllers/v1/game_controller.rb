class V1::GameController < ApplicationController

  def create
    @game = Game.create!
    render  json: @game
  end

  def update
    game = Game.find_by(id: params["game_id"])
    return head :not_found      if game.nil?

    word = ValidWord.find_by(word: params["word"])
    return head :not_acceptable if word.nil?

    game.valid_words << word

  end

end
