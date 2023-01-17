require_relative 'translator'

class NightReader < Translator
  attr_accessor :read_file,
                :write_file,
                :braille_alphabet

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    super
  end

  def english_alphabet
    super
  end

  def call
    super
  end
  
  def translate(braille_letter)
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