class Hangman
  def words
    @words ||= File.read('/usr/share/dict/words')
  end

  def answer(state, guesses)
    guess = ("a".."z").to_a.sample
    guess
  end

  def letters
    letters ||= ("a".."z").to_a
  end

  def make_guess(guesses)
    (letters - guesses).sample
  end
end
