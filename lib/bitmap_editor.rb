require_relative './command_parser.rb'
require_relative './bitmap.rb'
require 'pry'
class BitmapEditor
  attr_accessor :command_service
  def initialize
    @command_service = CommandService.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      @command_service.execute(line)
      sleep(3)
    end
  end
end


# create a way to automatically call the correct function for the command passed 
# i.e bitmap.new.send(parsed[:command],parsed[:parameters])
# Where parsed is the object returned from CommandParser class
