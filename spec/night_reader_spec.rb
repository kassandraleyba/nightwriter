require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }

  before do
    night_reader.read_file = './test_braille.txt'
    night_reader.write_file = './test_message.txt'
  end

  describe "#Initialize" do
    it "exists" do
      expect(night_reader).to be_a(NightReader)
    end
    
    it "has attributes" do
      expect(night_reader.read_file).to eq('./test_braille.txt')
      expect(night_reader.write_file).to eq('./test_message.txt')
    end
  end

  describe "#Call" do
    it "should write the translated message in the given file" do
      night_reader.call

      expect(File.read('./test_braille.txt')).to eq("0..0\n000.\n....")
    end
  end
  
  describe "#Translate" do
    xit "should translate two letters from braille to english" do
      expect(night_reader.translate("0.\n00\n..")).to eq("h")
    end

    it "should translate two letters from braille to english" do
      expect(night_reader.translate("0..0\n000.\n....")).to eq("hi")
      "00\n..\n0."
    end
  end
end