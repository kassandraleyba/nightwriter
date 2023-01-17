# require_relative 'spec_helper'
require './lib/translator'
require './lib/night_writer'

RSpec.describe NightWriter do
  let(:night_writer) { NightWriter.new }

  before do
    night_writer.read_file = './message.txt'
    night_writer.write_file = './braille.txt'
  end

  describe "#Initialize" do
    it "exists" do
      expect(night_writer).to be_a(NightWriter)
    end

    it "has attributes" do
      night_writer.call

      expect(night_writer.read_file).to eq('./message.txt')
      expect(night_writer.write_file).to eq('./braille.txt')
    end
  end

  describe "#Translate" do
    it "can translate a letter from english to braille" do
      expect(night_writer.translate("h")).to eq("0.\n00\n..")
    end

    it "can translate two letters from english to braille " do
      expect(night_writer.translate("hi")).to eq("0..0\n000.\n....")
    end

    it "can translate a sentence longer than 40 characters" do
      expect(night_writer.translate("the quick brown fox jumps over the lazy 
        dog")).to eq(".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..\n0000.0..00..0.........00..0...0.......0...0000..\n................000.00\n.................0.000\n..................0...")
    end
  end
end