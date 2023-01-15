require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }

  describe "#Initialize" do
    it "exists" do
      expect(night_reader).to be_a(NightReader)
    end
  end
end