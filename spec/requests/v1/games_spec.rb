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

    context 'valid requests' do
      describe '3 letters word' do
        let(:word){ 'sat'}
        let(:valid_json) do
          {
            word: word,
            score: 3
          }
        end

        before do
          ValidWord.create(word: word)
          post  game_path(game.id),
          params:  valid_json,
          headers: headers
        end

        it_behaves_like 'a successful request'

        it 'returns the word with score' do
          expected_score = SCORES["word_size"][word.size]
          expect(json)
          .to include_json(word: word, score: expected_score)
        end
      end

      describe '10 letters word' do
        let(:valid_json) do
          {
            word: 'huraxnicas',
            score: 3
          }
        end

        before do
          ValidWord.create(word: 'huraxnicas')
          post  game_path(game.id),
          params:  valid_json,
          headers: headers
        end

        it_behaves_like 'a successful request'

        it 'returns the word with score' do
          expect(json).to include_json(word: 'huraxnicas', score: 6)
        end
      end
    end

    context 'invalid requests' do
      context 'not playable' do
        describe '2 letters word' do
          let(:valid_json) do
            {
              word: 'hu',
              score: 3
            }
          end

          before do
            ValidWord.create(word: 'hu')
            post  game_path(game.id),
            params:  valid_json,
            headers: headers
          end

          it_behaves_like 'a bad request'
        end
        describe 'not adjacent word'
      end

      context 'game not found' do
        describe 'unexistent game' do
          let(:valid_json) do
            {
              word: 'huraxnicas',
              score: 3
            }
          end

          before do
            ValidWord.create(word: 'huraxnicas')
            post  game_path(game.id+999),
            params:  valid_json,
            headers: headers
          end

          it_behaves_like 'a not found request'
        end
      end
    end

    context 'word is not in the dictionary' do
      describe 'playable but inexistent word' do
        let(:valid_json) do
          {
            word: 'huraxnicas',
            score: 3
          }
        end

        before do
          ValidWord.create(word: 'huraxnicos')
          post  game_path(game.id),
          params:  valid_json,
          headers: headers
        end

        it_behaves_like 'a not acceptable request'
      end
    end

    context 'already played' do
      describe 'word has been submitted' do
        let(:valid_json) do
          {
            word: 'huraxnicas',
            score: 3
          }
        end

        before do
          game.valid_words << ValidWord.create(word: 'huraxnicas')
          post  game_path(game.id),
          params:  valid_json,
          headers: headers
        end

        it_behaves_like 'a conflict request'
      end
    end

  end

  describe "GET /game/{game_id}" do
    let!(:game) do
      vws = ValidWord.create([{word: 'huraxnicas'},
                              {word: 'getas'},
                              {word: 'sat'}])

      create(:game, :with_board).tap{ |gm| gm.valid_words << vws }
    end

    before { get game_path(game.id) }

    it_behaves_like 'a successful request'
    it_behaves_like 'has a game object payload'

    it 'concatenates and uppercase the board rows' do
      expect(json['board'][0]).to eq 'HUGTW'
    end

    it 'contains 3 words' do
      expect(json['words'].size).to eq 3
    end

    context 'display scores correctly based on configuration' do
      it 'has correct score for each word' do

        expect(json['words'][0]['score'])
        .to eq SCORES["word_size"][8] #huraxnicas > 8

        expect(json['words'][1]['score'])
        .to eq SCORES["word_size"]['getas'.size]

        expect(json['words'][2]['score'])
        .to eq SCORES["word_size"]['sat'.size]
      end

      it 'has correct score for game' do
        expected_score = SCORES["word_size"][8] +
                         SCORES["word_size"]['getas'.size] +
                         SCORES["word_size"]['sat'.size]
        expect(json['score']).to eq expected_score
      end
    end

    context 'game not found ' do
      before { get game_path(9999) }
      it_behaves_like 'a not found request'
    end
  end


end
