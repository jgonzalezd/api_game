require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'initialize the board before creation' do
    game = Game.create
    expect(game.board).to be_truthy
    expect(game.board.size).to be == 5
  end

end
