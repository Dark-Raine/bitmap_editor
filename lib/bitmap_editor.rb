require_relative './command_parser.rb'
require_relative './bitmap.rb'
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
    result = parsers.map {|parser| parser_instance.send(parser, unparsed_command)}.find {|val| !!val}
    return false unless !!result
    result
  end
  
  def perform_command(instruction_obj)
    # with the passed in instruction object, the command is finally performed using
    # the information within the instruction object
    bitmap = Bitmap.new
    bitmap.send(instruction_obj[:command].downcase, instruction_obj[:parameters])
  end
  
  def execute(unparsed_command)
    # uses the two other supporting methods execute a command passed in from the file
    instruction_obj = get_parsed_command(unparsed_command)
    instruction_obj ?  perform_command(instruction_obj) : false
  end
end
b1 = BitmapEditor.new.execute("I 4 4")
binding.pry

# create a way to automatically call the correct function for the command passed 
# i.e bitmap.new.send(parsed[:command],parsed[:parameters])
# Where parsed is the object returned from CommandParser class
