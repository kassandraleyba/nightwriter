class NightWriter
  attr_accessor :read_file,
                :write_file
  # change to attr_reader when stubbing

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end
  
  def call
    message_file = File.open(@read_file, "r")
    # new_file = File.new(@write_file, "w")
    
    
    text = message_file.read
    char_count = text.chars.count
    
    puts "Created #{@write_file} contains #{char_count} characters"
  
    File.write(@write_file, text)
  end

  # def translate_to_braille

  # end
end

# night_writer = NightWriter.new
# night_writer.call

# ^^^ this is acting like a runner file
# comment out when running rspec

# night_writer is a class that also acts as a runner file