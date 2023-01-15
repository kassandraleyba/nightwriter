require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }

  describe "#Initialize" do
    it "exists" do
      expect(night_reader).to be_a(NightReader)
    end

    it "has attributes" do
      night_reader.call

      expect(night_reader.read_file).to eq('./braille.txt')
      expect(night_reader.write_file).to eq('./message.txt')
    end
    end
  end
end