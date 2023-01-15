require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }

  before do
    night_reader.read_file = './braille.txt'
    night_reader.write_file = './message.txt'
  end

  describe "#Initialize" do
    it "exists" do
      expect(night_reader).to be_a(NightReader)
    end
    
    xit "has attributes" do
      # night_reader.call
      
      expect(night_reader.read_file).to eq('./braille.txt')
      expect(night_reader.write_file).to eq('./message.txt')
    end
  end
  
  describe "#Alphabet" do
    it "can invert the alphabet" do
      expected = {
        ["0.", "..", ".."] => "a",
        ["00", "..", ".."] => "b",
        ["0.", ".0", ".."] => "c"
      }
  
      expect(night_reader.english_alphabet).to eq(expected)
    end
  end
end