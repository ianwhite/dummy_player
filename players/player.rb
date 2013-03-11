require 'ian_hangman'

class Player
  def name
    "Ian White"
  end

  def take_turn(state, guesses)
    @hangman = IanHangman.new(state.length) if guesses.empty?
    @hangman.answer(state, guesses)
  end
end
