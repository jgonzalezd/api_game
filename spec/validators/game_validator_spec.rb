require 'rails_helper'

RSpec.describe GameValidator do
  context 'valid words' do
    describe 'horizontally continuous left to right' do
      context 'beginning of the row' do

        let(:game) do
          board = [[:h, :u, :g, :t, :k],
                   [:p, :r, :e, :a, :a],
                   [:s, :a, :t, :c, :s],
                   [:t, :x, :n, :i, :a],
                   [:m, :a, :o, :y, :o]]
          build(:game, board: board)
        end

        it 'finds the word in the first row' do
          game.valid_words << ValidWord.new(word: "HUG")
          expect(game).to be_valid
        end

        it 'finds the word in the last row' do
          game.valid_words << ValidWord.new(word: "MAO")
          expect(game).to be_valid
        end

        it 'finds the word in the middle rows' do
          game.valid_words << ValidWord.new(word: "PRE")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "SAT")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "TXN")
          expect(game).to be_valid
        end
      end

      context 'middle of the row' do
        let(:game) do
          board = [[:h, :u, :g, :t, :k],
                   [:p, :r, :e, :a, :a],
                   [:s, :a, :t, :c, :s],
                   [:t, :x, :n, :i, :a],
                   [:m, :a, :p, :y, :o]]
          build(:game, board: board)
        end

        it 'finds the word in the first row' do
          game.valid_words << ValidWord.new(word: "UGT")
          expect(game).to be_valid
        end
        it 'finds the word in the last row' do
          game.valid_words << ValidWord.new(word: "APYO")
          expect(game).to be_valid
        end
        it 'finds the word in the middle rows' do
          game.valid_words << ValidWord.new(word: "REA")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "TCS")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "XNIA")
          expect(game).to be_valid
        end
      end
    end

    describe 'horizontally continuous right to left' do
      context 'end of the row' do
        let(:game) do
          board = [[:h, :u, :p, :i, :z],
                   [:p, :r, :z, :a, :p],
                   [:s, :r, :a, :e, :y],
                   [:t, :k, :c, :o, :l],
                   [:m, :a, :u, :k, :o]]
          build(:game, board: board)
        end

        it 'finds the word in the first row' do
          game.valid_words << ValidWord.new(word: "ZIPUH")
          expect(game).to be_valid
        end

        it 'finds the word in the last row' do
          game.valid_words << ValidWord.new(word: "OKU")
          expect(game).to be_valid
        end

        it 'finds the word in the middle rows' do
          game.valid_words << ValidWord.new(word: "PAZ")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "YEARS")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "LOCK")
          expect(game).to be_valid
        end
      end

      context 'middle of the row' do
        let(:game) do
          board = [[:u, :p, :i, :z, :h],
                   [:z, :a, :p, :r, :p],
                   [:r, :a, :e, :y, :s],
                   [:k, :c, :o, :l, :t],
                   [:k, :o, :m, :a, :u]]
          build(:game, board: board)
        end

        it 'finds the word in the first row' do
          game.valid_words << ValidWord.new(word: "ZIPU")
          expect(game).to be_valid
        end

        it 'finds the word in the last row' do
          game.valid_words << ValidWord.new(word: "MOK")
          expect(game).to be_valid
        end

        it 'finds the word in the middle rows' do
          game.valid_words << ValidWord.new(word: "PAZ")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "YEAR")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "LOCK")
          expect(game).to be_valid
        end
      end
    end

    describe 'vertically continuous top to bottom' do
      context 'beginning of the col' do
        let(:game) do
          board = [[:u, :p, :i, :z, :l],
                   [:t, :a, :p, :r, :i],
                   [:o, :a, :e, :y, :o],
                   [:p, :c, :o, :l, :n],
                   [:y, :o, :m, :a, :u]]
          build(:game, board: board)
        end

        it 'finds the word in the first col' do
          game.valid_words << ValidWord.new(word: "UTOPY")
          expect(game).to be_valid
        end

        it 'finds the word in the last col' do
          game.valid_words << ValidWord.new(word: "LION")
          expect(game).to be_valid
        end

        it 'finds the word in the middle cols' do
          game.valid_words << ValidWord.new(word: "PAACO")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "IPEO")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "ZRY")
          expect(game).to be_valid
        end
      end

      context 'middle of the col' do
        let(:game) do
          board = [[:x, :p, :i, :z, :q],
                   [:t, :t, :p, :r, :i],
                   [:o, :a, :e, :y, :o],
                   [:p, :c, :o, :l, :n],
                   [:y, :o, :m, :a, :u]]
          build(:game, board: board)
        end

        it 'finds the word in the first col' do
          game.valid_words << ValidWord.new(word: "TOPY")
          expect(game).to be_valid
        end

        it 'finds the word in the last col' do
          game.valid_words << ValidWord.new(word: "ION")
          expect(game).to be_valid
        end

        it 'finds the word in the middle cols' do
          game.valid_words << ValidWord.new(word: "TACO")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "PEO")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "YLA")
          expect(game).to be_valid
        end
      end
    end

    describe 'vertically continuous bottom to top' do
      context 'bottom of the col' do
        let(:game) do
          board = [[:x, :p, :i, :z, :q],
                   [:t, :t, :p, :r, :i],
                   [:a, :a, :e, :y, :o],
                   [:e, :c, :o, :l, :n],
                   [:y, :o, :m, :a, :u]]
          build(:game, board: board)
        end

        it 'finds the word in the first col' do
          game.valid_words << ValidWord.new(word: "YEAT")
          expect(game).to be_valid
        end

        it 'finds the word in the last col' do
          game.valid_words << ValidWord.new(word: "UNO")
          expect(game).to be_valid
        end

        it 'finds the word in the middle cols' do
          game.valid_words << ValidWord.new(word: "OCA")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "MOE")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "ALY")
          expect(game).to be_valid
        end
      end

      context 'middle of the col' do

        let(:game) do
          board = [[:x, :p, :g, :z, :q],
                   [:t, :t, :e, :z, :w],
                   [:a, :a, :p, :y, :o],
                   [:r, :c, :j, :l, :n],
                   [:y, :o, :m, :a, :u]]
          build(:game, board: board)
        end

        it 'finds the word in the first col' do
          game.valid_words << ValidWord.new(word: "RAT")
          expect(game).to be_valid
        end

        it 'finds the word in the last col' do
          game.valid_words << ValidWord.new(word: "NOW")
          expect(game).to be_valid
        end

        it 'finds the word in the middle cols' do
          game.valid_words << ValidWord.new(word: "LYZZ")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "JPEG")
          expect(game).to be_valid

          game.valid_words << ValidWord.new(word: "CAT")
          expect(game).to be_valid
        end
      end
    end

    describe 'starts horizontally, follows vertically' do
      let(:game) do
        board = [[:x, :p, :g, :z, :q],
                 [:t, :t, :e, :z, :w],
                 [:a, :a, :p, :y, :o],
                 [:r, :c, :j, :l, :n],
                 [:y, :o, :m, :a, :v]]
        build(:game, board: board)
      end

      it 'finds left->righ, then top->bottom' do
        game.valid_words << ValidWord.new(word: "TEP")
        expect(game).to be_valid
      end

      it 'finds left->righ, then bottom->top' do
        game.valid_words << ValidWord.new(word: "YOCA")
        expect(game).to be_valid
      end

      it 'finds right->left, then top->bottom' do
        game.valid_words << ValidWord.new(word: "ZETACO")
        expect(game).to be_valid
      end

      it 'finds right->left, then bottom->top' do
        game.valid_words << ValidWord.new(word: "VALYZ")
        expect(game).to be_valid
      end
    end

    describe 'starts vertically, follows horizontally' do

      let(:game) do
        board = [[:x, :p, :g, :z, :q],
                 [:t, :t, :e, :z, :w],
                 [:a, :a, :p, :y, :o],
                 [:r, :c, :j, :l, :n],
                 [:y, :o, :m, :a, :k]]
        build(:game, board: board)
      end

      it 'finds top->bottom, then left->right' do
        game.valid_words << ValidWord.new(word: "TACOMA")
        expect(game).to be_valid
      end

      it 'finds top->bottom, then right->left' do
        game.valid_words << ValidWord.new(word: "WONKAMOY")
        expect(game).to be_valid
      end

      it 'finds bottom->top, then left->right' do
        game.valid_words << ValidWord.new(word: "CATEZ")
        expect(game).to be_valid
      end
      it 'finds bottom->top, then right->left' do
        game.valid_words << ValidWord.new(word: "ALYPA")
        expect(game).to be_valid
      end
    end

    describe 'looks recursively' do

      let(:game) do
        board = [[:x, :p, :g, :z, :q],
                 [:t, :r, :o, :a, :w],
                 [:a, :x, :m, :s, :o],
                 [:r, :c, :e, :t, :n],
                 [:y, :o, :d, :a, :k]]
        build(:game, board: board)
      end

      it 'search L->R, T->B, R->L, T->B' do
        game.valid_words << ValidWord.new(word: "ROASTED")
        expect(game).to be_valid
      end

      it 'search L->R, T->B, R->L, B->T' do
        game.valid_words << ValidWord.new(word: "ROASTEM")
        expect(game).to be_valid
      end
    end
  end

  context 'invalid words' do

      let(:game) do
        board = [[:h, :u, :g, :t, :k],
                 [:p, :r, :p, :a, :a],
                 [:s, :a, :t, :c, :s],
                 [:t, :t, :n, :i, :a],
                 [:r, :x, :d, :p, :o]]
        build(:game, board: board)
      end

      it 'invalidates not adjacent' do
        game.valid_words << ValidWord.new(word: "TAX")
        expect(game).not_to be_valid
      end

      it 'invalidates incomplete words' do
        game.valid_words << ValidWord.new(word: "HUGE")
        expect(game).not_to be_valid
      end

      it 'invalidates words of less than 3 chars' do
        game.valid_words << ValidWord.new(word: "PO")
        expect(game).not_to be_valid
      end
  end


end
