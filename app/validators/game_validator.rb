class GameValidator < ActiveModel::Validator
  attr_reader  :record, :board, :valid_words
  def validate(record)

    if record.is_a?(Game)
      @record      = record
      @valid_words = record.valid_words
    else
      @record      = record.game
      @valid_words = [] << record.valid_word
    end
    @board = @record.board
    record.errors[:base].concat(found_errors)
  end

  def found_errors
    errs = []
    return errs if valid_words.nil?
    valid_words.each do |vw|
      errs << "#{vw.word} is not playable" unless playable?(record, vw)
    end
    errs
  end

  def playable?(game, valid_word)
    word  = valid_word.word.downcase.split("")
    current_char = word.shift.to_sym
    board.each_with_index do |row, ridx|
      row.each_with_index do |el,  eidx|
        next if  current_char != el
        found = track(ridx, eidx, word.dup)
        return found if found
      end#row
    end#board
    false
  end

  private
    def generate_board
      self.board = Dice.shake.each_slice(5).to_a
    end

    def track(*state)
      ridx, eidx, word = state
      return true if word.empty?

      current_char = word.shift.to_sym

      # Left lookup
      unless eidx == 0
        left_char = board[ridx][eidx-1]
        if left_char == current_char
          found = track(ridx, eidx-1, word.dup)
          return found if found
        end
      end

      #above lookup
      unless ridx == 0
        above_char = board[ridx-1][eidx]
        if above_char == current_char
          found = track(ridx-1, eidx, word.dup)
          return found if found
        end
      end

      #right lookup
      unless eidx == (board.size - 1)
        right_char = board[ridx][eidx+1]
        if right_char == current_char
          found = track(ridx, eidx+1, word.dup)
          return found if found
        end
      end

      # below lookup
      unless ridx == (board.size - 1)
        below_char = board[ridx+1][eidx]
        if below_char == current_char
          found = track(ridx+1, eidx, word.dup)
          return found if found
        end
      end
      false
    end

end
