class V1::GameController < ApplicationController

  before_action :set_game, only: [:update, :show]

  attr_reader :game

  def create
    @game = Game.create!
    render  json: @game
  end

  def update

    return head :not_found      if game.nil?

    word = ValidWord.find_by(word: params["word"])
    return head :not_acceptable if word.nil?

    begin
      game.valid_words << word
    rescue ActiveRecord::RecordInvalid => e
      return head :bad_request if /not playable/ =~ e.message
    rescue ActiveRecord::RecordNotUnique => e
      return head :conflict
    rescue StandardError => e
      return head :internal_server_error
    end

    render json: word, head: :ok

  end

  def show
    render json: game
  end

  private
    def set_game
      @game = Game.find_by(id: params["game_id"])
      return head :not_found if @game.nil?
    end

end
