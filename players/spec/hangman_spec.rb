require 'hangman'

describe Hangman do

  describe ".new" do
    let(:hangman) { described_class.new }

    subject { hangman }

    it "should have some words" do
      subject.words.should include('brother')
    end

    describe "take_turn" do
      subject { hangman }
    end
  end
end
