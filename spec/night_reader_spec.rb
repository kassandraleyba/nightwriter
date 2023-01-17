# require_relative 'spec_helper'
require './lib/translator'
require './lib/night_reader'


RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }

  before do
    night_reader.read_file = './braille.txt'
    night_reader.write_file = './original_message.txt'
  end

  describe "#Initialize" do
    it "exists" do
      expect(night_reader).to be_a(NightReader)
    end
    
    it "has attributes" do
      night_reader.call
      
      expect(night_reader.read_file).to eq('./braille.txt')
      expect(night_reader.write_file).to eq('./original_message.txt')
    end
  end
  
  describe "#Translate" do
    it "can translate a letter from braille to english" do
      expect(night_reader.translate("0.\n00\n..")).to eq("h")
    end

    it "can translate two letters from braille to english " do
      expect(night_reader.translate("0..0\n000.\n....")).to eq("hi")
    end
  end
end