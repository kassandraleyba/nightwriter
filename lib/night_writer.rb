class NightWriter # < Translator
  attr_accessor :read_file,
                :write_file, 
                :braille_alphabet
  # change to attr_reader when stubbing

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
        braille.join.chars.each_slice(80).map do |slice|
          slice.join
        end
    end.transpose.join("\n")
  end
end

# night_writer = NightWriter.new
# night_writer.call

# ^^^ this is acting like a runner file
# comment out when running rspec