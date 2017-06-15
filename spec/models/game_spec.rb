require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'initialize the board before creation' do
    Game.create
    expect(Game.board.size).to be == 25
  end
end
