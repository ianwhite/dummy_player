require 'ian_hangman'

describe IanHangman do

  describe ".new" do
    let(:hangman) { described_class.new 5 }

    subject { hangman }

    it "should have some words of the right length" do
      subject.words.should include('zonal')
    end

    describe "with words stubbed" do
      let(:hangman) { described_class.new 5, ['axe', 'oxe', 'black', 'sheep', 'book'] }

      it "after should restrict itself to words matching length" do
        hangman.words.should == ['black', 'sheep']
      end

      describe "answer(state, guesses)" do
        subject { hangman.answer(state, guesses) }

        let(:state)   { "_____" }
        let(:guesses) { [] }

        describe "with no words available" do
          let(:hangman) { described_class.new 5, [] }

          context "First time" do
            it "should return a freq letters" do
              hangman.answer(state, []).should == 'e'
              hangman.answer(state, ['e']).should == 't'
              hangman.answer(state, ['e', 't']).should == 'o'
            end
          end
        end

        describe "#restrict_words(state)" do
          it { hangman.restrict_words('_____'); hangman.words.should == ['black', 'sheep'] }

          it "should restrict words by state" do
            hangman.restrict_words('_l___')
            hangman.words.should == ['black']
          end
        end

        describe "#make_educated_guess" do
          it "should guess the next best letter based on words" do
            hangman.make_educated_guess('_____', ['b']).should == 'e'
            hangman.make_educated_guess('_____', ['b', 'e', 'h', 'a']).should == 'c'
          end

          it "should look at signular made plural words if last letter s" do
            hangman.make_educated_guess('____s', ['e', 'k']).should == 'o'
          end
        end
      end
    end
  end
end
