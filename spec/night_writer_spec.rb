require "./lib/night_writer"

RSpec.describe NightWriter do
  let(:night_writer) { NightWriter.new }

  before do
    night_writer.read_file = './message.txt'
    night_writer.write_file = './braille.txt'
  end

  it "exists" do
    expect(night_writer).to be_a(NightWriter)
  end

  it "has attributes" do
    # allow(night_writer).to receive(:read_file).and_return('./message.txt')
    # allow(night_writer).to receive(:write_file).and_return('./braille.txt')
    # stubbing two attributes
    # stubbing should be for specific things you want to return

    night_writer.call

    expect(night_writer.read_file).to eq('./message.txt')
    expect(night_writer.write_file).to eq('./braille.txt')
  end
end