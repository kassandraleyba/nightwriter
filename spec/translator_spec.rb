require_relative 'spec_helper'

RSpec.describe Translator do
  let(:translator) { Translator.new }

  describe "#Initialize" do
    it "exists" do
      expect(translator).to be_a(Translator)
    end
  end

  describe "#Alphabet" do
    it "can have an alphabet in braille" do
      expected = {
        'a' => ['0.', '..', '..'],
        'b' => ['0.', '0.', '..'],
        'c' => ['00', '..', '..']
      }

      expect(translator.braille_alphabet).to eq(expected)
    end

    it "can have an alphabet in english" do
      expected = {
        ['0.', '..', '..'] => 'a',
        ['0.', '0.', '..'] => 'b',
        ['00', '..', '..'] => 'c'
      }
    
      expect(translator.english_alphabet).to eq(expected)
    end
  end
end