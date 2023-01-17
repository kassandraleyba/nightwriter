require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }

  before do
    night_reader.read_file = './test_braille.txt'
    night_reader.write_file = './test_original_message.txt'
  end

  describe "#Initialize" do
    it "exists" do
      expect(night_reader).to be_a(NightReader)
    end
    
    it "has attributes" do
      expect(night_reader.read_file).to eq('./test_braille.txt')
      expect(night_reader.write_file).to eq('./test_original_message.txt')
    end
  end

  describe "#Call" do
    it "should write the translated message in the given file" do
      night_reader.call

      expect(File.read('./test_original_message.txt')).to eq("hi")
    end
  end
  
  describe "#Translate" do
    it "should translate a letter from english to braille" do
      expect(night_reader.translate("0.\n00\n..")).to eq("h")
    end

    it "should translate two letters from braille to english" do
      expect(night_reader.translate("0..0\n000.\n....")).to eq("hi")
    end

    it "should translate a sentence and word wrap" do
      expect(night_reader.translate(".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..000.00\n0000.0..00..0.......0.00.000.0..0..0..........0.0....00..000..0000.0..0....0.0...0.000\n0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000....0...")).to eq("the quick brown fox jumps over the lazy \ndog")
    end
  end
end