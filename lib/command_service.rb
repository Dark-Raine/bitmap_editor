class CommandService
    attr_accessor :bitmap, :command_parser

    def initialize 
        @bitmap = Bitmap.new
        @command_parser = CommandParser.new
    end

    def get_parsed_command(unparsed_command)
        # this will parse the command if it's valid
        parsers = CommandParser.instance_methods(false)
        result = parsers.map {|parser| @command_parser.send(parser, unparsed_command)}.find {|val| !!val}
        return false unless !!result
        result
      end
      
      def perform_command(instruction_obj)
        # with the passed in instruction object, the command is finally performed using
        # the information within the instruction object
        @bitmap.send(instruction_obj[:command].downcase, instruction_obj[:parameters])
      end
      
      def execute(unparsed_command)
        # uses the two other supporting methods execute a command passed in from the file
        instruction_obj = get_parsed_command(unparsed_command)
        instruction_obj ?  perform_command(instruction_obj) : false
      end
end


# the idea here is to have a service like class that will perform all the actions we need
# ensuring things are running as intended by providing good returns that will tell the editor when to display errors