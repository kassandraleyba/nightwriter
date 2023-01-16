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
      night_reader.call
      
      expect(night_reader.read_file).to eq('./braille.txt')
      expect(night_reader.write_file).to eq('./message.txt')
    end
  end
  
  describe "#Alphabet" do
    xit "can invert the alphabet" do
      expected = {
        ["0.", "..", ".."] => "a",
        ["0.", "0.", ".."] => "b",
        ["00", "..", ".."] => "c"
      }
  
      expect(night_reader.english_alphabet).to eq(expected)
    end
  end

  describe "Translate" do
    it "can translate braille to a letter" do
      expect(night_reader.translate_to_english("0.\n..\n..")).to eq("a")
    end
  end
end