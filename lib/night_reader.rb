class NightReader
  attr_accessor :read_file,
                :write_file
                
  def initialize
    @read_file = ARGV[1]
    @write_file = ARGV[0]
  end
end

# night_reader = NightReader.new
# night_reader.call