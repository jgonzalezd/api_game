require 'rails_helper'

RSpec.describe "Games", type: :request do
  let(:headers) do
    {
      'ACCEPT' => 'application/json'
    }
  end
  describe "POST /game" do
    before { post game_index_path }
    it_behaves_like 'a successful request'
    it_behaves_like 'has a game object payload'
  end

  describe 'POST /game/{game_id}' do
    let!(:game) { create(:game, :with_board) }
    before(:all) do
      ValidWord.create([{word: 'SAT'}])
    end

    context 'validations' do
      it 'accepts a valid word' do
        json_data =
        {
          word: 'SAT',
          score: 3
        }
        post  game_path(game.id),
              params:  json_data,
              headers: headers
      end
    end
  end
end
