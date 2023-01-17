require_relative 'translator'

class NightWriter < Translator
  attr_accessor :read_file,
                :write_file, 
                :braille_alphabet
  # change to attr_reader when stubbing

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    super
  end
  
  def call
    super
  end

  def translate(message)
    braille = message.split('')
    
    braille_values = braille.filter_map do |letter|
        @braille_alphabet[letter.downcase]
    end
    # [[".0", "00", "0."], ["0.", "00", ".."], [etc]]
    
    sliced_chars = braille_values.transpose.map do |braille_letter|
      braille_letter.join.chars.each_slice(80).map do |sliced_letter|
        sliced_letter.join
      end
    end.transpose.join("\n")
    # ".00.0...000 etc"
  end
end

# night_writer = NightWriter.new
# night_writer.call