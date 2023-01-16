class NightReader
  attr_accessor :read_file,
                :write_file,
                :braille_alphabet

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @braille_alphabet = {
      'a' => ['0.', '..', '..'],
      'b' => ['0.', '0.', '..'],
      'c' => ['00', '..', '..'],
      'd' => ['00', '.0', '..'],
      'e' => ['0.', '.0', '..'],
      'f' => ['00', '0.', '..'],
      'g' => ['00', '00', '..'],
      'h' => ['0.', '00', '..'],
      'i' => ['.0', '0.', '..'],
      'j' => ['.0', '..', '..'],
      'k' => ['0.', '..', '0.'],
      'l' => ['0.', '0.', '0.'],
      'm' => ['00', '..', '0.'],
      'n' => ['00', '.0', '0.'],
      'o' => ['0.', '.0', '0.'],
      'p' => ['00', '0.', '0.'],
      'q' => ['00', '00', '0.'],
      'r' => ['0.', '00', '0.'],
      's' => ['.0', '0.', '0.'],
      't' => ['.0', '00', '0.'],
      'u' => ['0.', '..', '00'],
      'v' => ['0.', '0.', '00'],
      'w' => ['.0', '00', '.0'],
      'x' => ['00', '..', '00'],
      'y' => ['00', '.0', '00'],
      'z' => ['0.', '.0', '00'],
      " " => ["..", "..", ".."],
      "," => ["..", "0.", ".."],
      "'" => ["..", "..", "0."],
      "!" => ["..", "00", "0."],
      "?" => ["..", "0.", "00"]
    }
  end

  def english_alphabet
    @braille_alphabet.invert
  end

  def call
    message = File.read(@read_file)
    
    char_count = message.delete("\n").chars.count
    puts "Created #{@write_file} contains #{char_count} characters"
    
    translated_text = translate_to_english(message)
    
    File.write(@write_file, translated_text)
  end
  
  def translate_to_english(braille_letter)
    message = File.read(@read_file)
    braille_split = []
    braille_split << message.split
    
    
    joined_chars = []
    braille_split.filter_map do |braille|
      braille.each do |characters|
        joined_chars << characters.chars.each_slice(2).map(&:join)
      end
    end
    # [["0.", "0."], ["..", ".."], ["..", ".."]]

    three_arrays = joined_chars.each_slice(3).map do |three_chars|
      three_chars
    end
    # [ [ [0],[1],[2] ], [ [0],[1],[2] ]  ]

    final_english_string = three_arrays.map do |two_arrays|
      two_arrays.transpose.map do |braille_letter_array|
        english_alphabet[braille_letter_array]
      end
    end.join
    final_english_string.scan(/.{40}|.+/).join("\n")
    # scan method . = 40 characters & .+ = remaining characters
    # require 'pry'; binding.pry
    # "aa"
  end
end

# night_reader = NightReader.new
# night_reader.call