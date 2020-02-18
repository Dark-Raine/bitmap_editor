# parse string commands into valid command objects for the bitmap editor
# require 'pry'
class CommandParser
    
    # def execute(unparsed_command)
    #     # this will parse the command if it's valid
    #     parsers = CommandParser.instance_methods(false)
    #     parsers.select {|parser| !!self.send(parser, unparsed_command)}
    # end

    def parse_create_bitmap_command(command)
        #function for parsing the I command
        # validates with regex and returns an object 
        validator = /(^[I])(\s)(\d{1,3})(\s)(\d{1,3}$)/
        validated = validator.match(command)
        return false unless validated
        to_filter = validated.captures
        parsed = to_filter.filter {|element| element != " "}
        {command: parsed[0], parameters:{ x: parsed[1], y: parsed[2]}}
    end
    
    def parse_clear_bitmap_command(command)
        #function for parsing the C command
        # validates with regex and returns an object 
        validator = /(^[C]$)/
        validated = validator.match(command)
        return false unless validated
        parsed = validated.captures
        {command: parsed[0]}
    end
    # def space_filter(arr)
    #     binding.pry
    #     # arr.split(" ")
    #     arr.filter {|element| element != " "}
    # end
end

# CommandParser.new.execute("I 5 6")