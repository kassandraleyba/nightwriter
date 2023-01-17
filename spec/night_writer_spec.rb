require_relative 'spec_helper'

RSpec.describe NightWriter do
  let(:night_writer) { NightWriter.new }

  before do
    night_writer.read_file = './test_message.txt'
    night_writer.write_file = './test_braille.txt'
  end

  describe "#Initialize" do
    it "exists" do
      expect(night_writer).to be_a(NightWriter)
    end

    it "has attributes" do
      expect(night_writer.read_file).to eq('./test_message.txt')
      expect(night_writer.write_file).to eq('./test_braille.txt')
    end
  end

  describe "#Call" do
    it "should write the translated message in the given file" do
      night_writer.call

      expect(File.read('./test_braille.txt')).to eq("0..0\n000.\n....")
    end
  end

  describe "#Translate" do
    it "should translate a letter from english to braille" do
      expect(night_writer.translate("h")).to eq("0.\n00\n..")
    end

    it "can translate two letters from english to braille " do
      expect(night_writer.translate("hi")).to eq("0..0\n000.\n....")
    end
  end
end