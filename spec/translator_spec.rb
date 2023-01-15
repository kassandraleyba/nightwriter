require_relative 'spec_helper'

RSpec.describe Translator do
  let(:translator) { Translator.new }

  describe "#Initialize" do
    xit "exists" do
      expect(translator).to be_a(Translator)
    end
  end
end