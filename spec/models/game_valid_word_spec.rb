require 'rails_helper'

RSpec.describe GameValidWord, type: :model do
  describe 'playable words' do

    context 'validation' do

      let(:game)        { build(:game)}
      let(:valid_word)  { build(:valid_word)}

      describe 'uses custom validator' do

        subject { GameValidWord.new(game: game, valid_word: valid_word)}

        it 'validates valid game' do
          allow_any_instance_of(GameValidator)
          .to receive(:found_errors).and_return([])
          expect(subject).to be_valid
        end

        it 'invalidates invalid game' do
          allow_any_instance_of(GameValidator)
          .to receive(:found_errors) { |gv| gv.record.errors[:base] << "Invalid" }
          expect(subject).to_not be_valid
        end
      end
    end
  end
end
