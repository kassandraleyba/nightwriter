require_relative 'spec_helper'

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
  end
end