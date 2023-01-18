require_relative 'translator'

class NightReader < Translator
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    super
  end

  def english_alphabet
    super
  end

  def call
    message = File.read(@read_file)
    
    translated_text = translate(message)

    puts "Created #{@write_file} contains #{translated_text.delete("\n").length} characters"
    
    File.write(@write_file, translated_text)
  end
  
  def translate(message)
    braille_split = []
    braille_split << message.split
    
    
    joined_chars = []
    braille_split.filter_map do |braille|
      braille.each do |characters|
        joined_chars << characters.chars.each_slice(2).map(&:join)
      end
    end

    three_arrays = joined_chars.each_slice(3).map do |three_chars|
      three_chars
    end

    final_english_string = three_arrays.map do |two_arrays|
      two_arrays.transpose.map do |braille_letter_array|
        english_alphabet[braille_letter_array]
      end
    end.join
    final_english_string
    # require 'pry'; binding.pry
    # .scan(/.{40}|.+/).join("\n")
  end
end

