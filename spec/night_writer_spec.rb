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
      night_writer.read_write_text

      expect(night_writer.read_file).to eq('./message.txt')
      expect(night_writer.write_file).to eq('./braille.txt')
    end
  end 

  describe "Translate" do
    it "can translate a letter to braille" do
      expect(night_writer.translate_to_braille("a")).to eq("0.\n..\n..")
      # expect(night_writer.translate_to_braille("b")).to eq("00\n..\n..")
    end
  end
end