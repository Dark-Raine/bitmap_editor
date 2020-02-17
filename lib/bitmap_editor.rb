require_relative './command_parser.rb'
require 'pry'
class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
          puts "There is no image"
      else
          puts 'unrecognised command :('
      end
    end
  end

  def get_parsed_command(unparsed_command)
    # this will parse the command if it's valid
    parser_instance = CommandParser.new
    parsers = CommandParser.instance_methods(false)
    parsers.map {|parser| parser_instance.send(parser, unparsed_command)}
    .find {|val| !!val}
  end

  def perform_command(bitmap_obj)
    # @bitmap || @bitmap = Bitmap.new
    bitmap = Bitmap.new

    bitmap.send(bitmap_obj[:command], bitmap_obj[:parameters])
  end
end
b1 = BitmapEditor.new.get_parsed_command("I 5 6")
binding.pry

# create a way to automatically call the correct function for the command passed 
# i.e bitmap.new.send(parsed[:command],parsed[:parameters])
# Where parsed is the object returned from CommandParser class
