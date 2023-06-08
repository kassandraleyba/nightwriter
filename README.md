# Nightwriter

Night writing is a system of code using symbols of twelve dots arranged as two columns of six dots embossed on a square of paperboard. This tactile code was developed by Charles Barbier, and was later used to develop a writing system called braille.

Enjoy the NightWriter App, a powerful tool that effortlessly converts English to braille and vice versa. Seamlessly navigate between these two writing systems, enabling enhanced accessibility and communication. Experience the practicality and convenience of transforming text into the intricate patterns of braille, and easily decipher braille back into familiar English words. Embrace the NightWriter App as your gateway to a world where language transcends barriers, making communication more inclusive and efficient.

## Instructions for Running the Files:

Uncomment the following lines in "./lib/night_writer.rb":

- night_writer = NightWriter.new
- night_writer.call

Then run the following line in the command line:

- ruby lib/night_writer.rb message.txt braille.txt

Uncomment the following lines in "./lib/night_reader.rb":

- night_reader = NightReader.new
- night_reader.call

Then run the following line in the command line:

- ruby lib/night_reader.rb braille.txt original_message.txt
