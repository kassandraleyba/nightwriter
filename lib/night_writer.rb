require_relative 'translator'

class NightWriter < Translator
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    super
  end
  
  def call
    message = File.read(@read_file)
    
    translated_text = translate(message)

    puts "Created #{@write_file} contains #{translated_text.length / 6} characters"
    
    File.write(@write_file, translated_text)
  end

  def translate(message)
    braille = message.split('')
    
    braille_values = braille.filter_map do |letter|
        @braille_alphabet[letter.downcase]
    end
    
    sliced_chars = braille_values.transpose.map do |braille_letter|
      braille_letter.join.chars.each_slice(80).map do |sliced_letter|
        sliced_letter.join
      end
    end.transpose.join("\n")
  end
end

night_writer = NightWriter.new
night_writer.call