require 'ian_hangman'

describe IanHangman do

  describe ".new" do
    let(:hangman) { described_class.new 5 }

    subject { hangman }

    it "should have some words" do
      subject.words.should include('zonal')
    end

    describe "with words stubbed" do
      let(:hangman) { described_class.new 5, ['axe', 'oxe', 'black'] }

      describe "answer(state, guesses)" do
        subject { hangman.answer(state, guesses) }

        let(:state)   { "_____" }
        let(:guesses) { [] }

        it "after should restrict itself to words matching state" do
          subject
          hangman.words.should == ['black']
        end

        context "First time" do
          it "should return a freq letters" do
            subject.should == 'e'
            hangman.answer(state, ['e']).should == 't'
            hangman.answer(state, ['e', 't']).should == 'o'
          end
        end
      end
    end
  end
end
