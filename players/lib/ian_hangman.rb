class IanHangman
  attr_reader :words

  def initialize length, words = nil
    words ||= self.class.words
    @words = words.select {|w| w.length == length }
  end

  def self.words
    File.read('/usr/share/dict/words').split("\n")
  end

  def answer(state, guesses)
    restrict_words(state)
    guess = make_guess(guesses)
    guess
  end

  def letters
    %w(e t o a n i s r h d l u c m f y w g p b v k x q j z)
  end

  def make_guess(guesses)
    (letters - guesses)[0]
  end

  def restrict_words(state)
    words
  end
end
