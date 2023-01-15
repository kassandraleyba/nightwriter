class NightWriter # < Translator
  attr_accessor :read_file,
                :write_file, 
                :braille_alphabet
  # change to attr_reader when stubbing

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @braille_alphabet = {
      "a" => ["0.", "..", ".."],
      "b" => ["00", "..", ".."],
      "c" => ["0.", ".0", ".."],
      "d" => ["0.", ".0", "0."],
      "e" => ["0.", "..", "0."],
      "f" => ["00", ".0", ".."],
      "g" => ["00", ".0", "0."],
      "h" => ["00", "..", "0."],
      "i" => [".0", ".0", ".."],
      "j" => [".0", ".0", "0."],
      "k" => ["0.", "0.", ".."],
      "l" => ["00", "0.", ".."],
      "m" => ["0.", "00", ".."],
      "n" => ["0.", "00", "0."],
      "o" => ["0.", "0.", "0."],
      "p" => ["00", "00", ".."],
      "q" => ["00", "00", "0."],
      "r" => ["00", "0.", "0."],
      "s" => [".0", "00", ".."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "0.", ".0"],
      "v" => ["00", "0.", ".0"],
      "w" => [".0", ".0", "00"],
      "x" => ["0.", "00", ".0"],
      "y" => ["0.", "00", "00"],
      "z" => ["0.", "0.", "00"],
      " " => ["..", "..", ".."],
      "," => ["..", "0.", ".."],
      "'" => ["..", "..", "0."],
      "!" => ["..", "00", "0."],
      "?" => ["..", "0.", "00"]
      # account for punctuation
    }
  end
  
  def call
    message = File.read(@read_file)
   
    char_count = message.chars.count
    
    puts "Created #{@write_file} contains #{char_count} characters"
  
    translated_text = translate_to_braille(message)

    File.write(@write_file, translated_text)
  end

  def translate_to_braille(letter)
    message = File.read(@read_file)
    braille = message.split('')
    
    braille_values = braille.map do |letter|
        @braille_alphabet[letter.downcase]
      end
      
      sliced_chars = braille_values.transpose.map do |braille|
        braille.join.chars.each_slice(40).map do |slice|
          slice.join
          # require 'pry'; binding.pry
        end
    end.transpose.join("\n")
  end
end

# night_writer = NightWriter.new
# night_writer.call

# ^^^ this is acting like a runner file
# comment out when running rspec