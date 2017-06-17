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
    return false if word.size < 3
    current_char = word.shift.to_sym
    board.each_with_index do |row,  row_index|
      row.each_with_index do |el,  elem_index|
        next if  current_char != el
        found = track(row_index, elem_index, word.dup)
        return found if found
      end#row
    end#board
    false
  end

  private

    def track(*state)
      row_index, elem_index, word = state
      return true if word.empty?

      current_char = word.shift.to_sym

      # Left lookup
      unless elem_index == 0
        left_char = board[row_index][elem_index-1]
        if left_char == current_char
          found = track(row_index, elem_index-1, word.dup)
          return found if found
        end
      end

      #above lookup
      unless row_index == 0
        above_char = board[row_index-1][elem_index]
        if above_char == current_char
          found = track(row_index-1, elem_index, word.dup)
          return found if found
        end
      end

      #right lookup
      unless elem_index == (board.size - 1)
        right_char = board[row_index][elem_index+1]
        if right_char == current_char
          found = track(row_index, elem_index+1, word.dup)
          return found if found
        end
      end

      # below lookup
      unless row_index == (board.size - 1)
        below_char = board[row_index+1][elem_index]
        if below_char == current_char
          found = track(row_index+1, elem_index, word.dup)
          return found if found
        end
      end
      false
    end

end
