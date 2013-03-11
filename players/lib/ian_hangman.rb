class IanHangman
  attr_reader :words

  def initialize length, words = nil
    words ||= self.class.words
    @words = words.select {|w| w.length == length }
    @words = @words.map &:downcase
  end

  def self.words
    File.read('/usr/share/dict/words').split("\n")
  end

  def answer(state, guesses)
    restrict_words(state)
    if words.empty?
      guess = make_freq_guess(guesses)
    else
      guess = make_educated_guess(guesses)
    end
    guess
  end

  def make_freq_guess(guesses)
    letters = %w(e t o a n i s r h d l u c m f y w g p b v k x q j z)
    (letters - guesses)[0]
  end

  def restrict_words(state)
    regexp = state.gsub('_','.')
    @words = words.select {|w| w =~ %r{^#{regexp}$} }
  end

  def frequencies_for_words
    letters = [0] * 26
    words.each do |word|
      in_word = word.split(//)
      in_word.each do |letter|
        ord = letter.ord - 97
        letters[ord] += 1
      end
    end

    freqs = []
    ('a'..'z').each_with_index {|l, i| freqs << [l, letters[i]]}
    freqs
  end

  def make_educated_guess guesses
    freqs = frequencies_for_words
    freqs = freqs.reject {|pair| guesses.include?(pair.first)}
    freqs = freqs.sort_by {|pair| pair.last }
    freqs.last.first
  end
end
