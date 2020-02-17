# parse string commands into valid command objects for the bitmap editor
require 'pry'
class CommandParser
    
    def execute(unparsed_command)
        # this will parse the command if it's valid
    end

    def parse_create_bitmap_command(command)
        validator = /(^[I])(\s)(\d{1,3})(\s)(\d{1,3}$)/
        validated = validator.match(command)
        return false unless validated
            parsed = space_filter(validated.captures)
            {command: parsed[0], x: parsed[1], y: parsed[2]}
    end

    def space_filter(arr)
        arr.filter {|element| element != " "}
    end
end

binding.pry