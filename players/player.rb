require_relative 'lib/hangman'

class Player
  def name
    "Ian White"
  end

  def take_turn(state, guesses)
    if guesses.empty?
      @hangman = Hangman.new
    end
    @hangman.answer(state, guesses)
  end
end
